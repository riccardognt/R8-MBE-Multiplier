library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity data_gen is  
  port (
    CLK   : in std_logic;
    RST_n : in std_logic;
    D0    : out std_logic_vector(31 downto 0);
    D1    : out std_logic_vector(31 downto 0);
    D2    : out std_logic_vector(31 downto 0);
    RDY   : in std_logic;
    VOUT  : out std_logic;
    END_SIM : out std_logic);
end entity data_gen;

architecture beh of data_gen is

  constant tco : time := 1 ns;

  type tval_t is array (0 to 9) of std_logic_vector(31 downto 0);
  constant ctvalA : tval_t := (																					-- 15/8	   --0.875=2^(-1)+2^(-2)+2^(-3) 
    ('0' & conv_std_logic_vector(127+3, 8) & conv_std_logic_vector(7, 3) & conv_std_logic_vector(0, 23-3)),  --15 01000011.11100000000000000000000
    ('0' & conv_std_logic_vector(127+7, 8) & conv_std_logic_vector(19, 5) & conv_std_logic_vector(0, 23-5)),  --204
    ('0' & conv_std_logic_vector(127+10, 8) & conv_std_logic_vector(0, 23)),  --1024
    ('1' & conv_std_logic_vector(127+3, 8) & conv_std_logic_vector(7, 3) & conv_std_logic_vector(0, 23-3)),  -- -15
    ('1' & conv_std_logic_vector(127+7, 8) & conv_std_logic_vector(19, 5) & conv_std_logic_vector(0, 23-5)),  -- -204
    ('1' & conv_std_logic_vector(127+10, 8) & conv_std_logic_vector(0, 23)),   -- -1024
	('0' & conv_std_logic_vector(127+1, 8) & conv_std_logic_vector(1, 1) & conv_std_logic_vector(0, 23-1)), --3
	('1' & conv_std_logic_vector(127+6, 8) & conv_std_logic_vector(753664, 23)), -- -69.75
	('0' & conv_std_logic_vector(127+9, 8) & conv_std_logic_vector(1037844, 23)), -- 575.345
	('0' & conv_std_logic_vector(127+4, 8) & conv_std_logic_vector(5767168, 23)) -- 27


    );  

  constant ctvalB : tval_t := (
    ('0' & conv_std_logic_vector(127+7, 8) & conv_std_logic_vector(19, 5) & conv_std_logic_vector(0, 23-5)),  --204
    ('0' & conv_std_logic_vector(127+10, 8) & conv_std_logic_vector(0, 23)),  --1024
    ('1' & conv_std_logic_vector(127+3, 8) & conv_std_logic_vector(7, 3) & conv_std_logic_vector(0, 23-3)),  -- -15
    ('1' & conv_std_logic_vector(127+7, 8) & conv_std_logic_vector(19, 5) & conv_std_logic_vector(0, 23-5)),  -- -204
    ('1' & conv_std_logic_vector(127+10, 8) & conv_std_logic_vector(0, 23)),   -- -1024
    ('0' & conv_std_logic_vector(127+3, 8) & conv_std_logic_vector(7, 3) & conv_std_logic_vector(0, 23-3)),   --15
	('0' & conv_std_logic_vector(127+2, 8) & conv_std_logic_vector(5, 3) & conv_std_logic_vector(0, 23-3)), --6.5
	('1' & conv_std_logic_vector(127+5, 8) & conv_std_logic_vector(4639949, 23)), -- -49.7
	('0' & conv_std_logic_vector(127+9, 8) & conv_std_logic_vector(1831731, 23)), -- 623.8
	('1' & conv_std_logic_vector(127+7, 8) & conv_std_logic_vector(1572864, 23)) -- -152
   
    );  
  
  signal cnt : integer := 0;
  signal sEnd_sim : std_logic;

  signal sEnd_sim_pipe : std_logic_vector(9 downto 0);
  
begin  -- architecture beh

  process (CLK, RST_n) is
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      cnt <= 0;  
      D0 <= (others => '0');
      D1 <= (others => '0');
      D2 <= (others => '0');
      VOUT <= '0';
      sEnd_sim <= '0';
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (cnt < 10) then
        cnt <= cnt + 1 after tco;
        D0 <= ctvalA(cnt) after tco;
        D1 <= ctvalB(cnt) after tco;
        VOUT <= '1' after tco;
        sEnd_sim <= '0' after tco;          
      else
        VOUT <= '0' after tco;
        sEnd_sim <= '1' after tco;
      end if;
    end if;
  end process;

  process (CLK, RST_n) is
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      sEnd_sim_pipe <= (others => '0');
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      sEnd_sim_pipe(0) <= sEnd_sim after tco;
      sEnd_sim_pipe(9 downto 1) <= sEnd_sim_pipe(8 downto 0) after tco;
    end if;
  end process;

  END_SIM <= sEnd_sim_pipe(9);

end beh;
