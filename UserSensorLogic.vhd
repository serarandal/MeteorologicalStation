----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2020 12:14:32
-- Design Name: 
-- Module Name: UserSensorLogic - logic
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UserSensorLogic is
    Port ( clk_user : out STD_LOGIC ;
           reset_n_user : out STD_LOGIC;
           ena_user : out STD_LOGIC ;
           addr_user : out STD_LOGIC_VECTOR (6 downto 0);
           rw_user : out STD_LOGIC ;
           data_wr_user : out STD_LOGIC_VECTOR (7 downto 0);
           data_rd_user : in STD_LOGIC_VECTOR (7 downto 0);
           busy_user : in STD_LOGIC ;
           ack_error_user : in STD_LOGIC ;
           sda_user : inout STD_LOGIC ;
           scl_user : inout STD_LOGIC ;
           clk_ram_user : out STD_LOGIC ;
           wr_ena_ram_user : out STD_LOGIC ;
           addr_ram_user : out integer;
           data_in_ram_user : out STD_LOGIC_VECTOR (7 downto 0);
           data_out_esp_user : out STD_LOGIC_VECTOR (7 downto 0));
end UserSensorLogic;

architecture logic of UserSensorLogic is
      
    
    SIGNAL wrtempBMP180 : integer := 0 ;
    SIGNAL rdtempBMP180 : integer := 0;
    SIGNAL wrpressureBMP180 : integer := 0;
    SIGNAL rdpressureBMP180 : integer := 0;
    SIGNAL wrSHT85 : integer := 0;
    SIGNAL rdSHT85 : integer := 0;
    SIGNAL wrTC74 : integer := 0;
    SIGNAL rdTC74 : integer := 0;
    SIGNAL wrYL83 : integer := 0;
    SIGNAL rdYL83 : integer := 0;
    SIGNAL x : integer := 0;
    SIGNAL i : integer := 0;
    SIGNAL j : integer := 0;
    SIGNAL k : integer := 0;
    SIGNAL l : integer := 0;
    SIGNAL m : integer := 0;
    SIGNAL n : integer := 0;
    SIGNAL ena_status : STD_LOGIC;
    SIGNAL addr_status : STD_LOGIC_VECTOR(6 downto 0);
    SIGNAL rw_status : STD_LOGIC;
    SIGNAL data_wr_status : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL sda_status : STD_LOGIC;
    SIGNAL scl_status : STD_LOGIC;
    SIGNAL clk_ram_status: STD_LOGIC;
    SIGNAL wr_ena_ram_status:STD_LOGIC;
    SIGNAL addr_ram_status:integer :=0;
    SIGNAL data_in_ram_status:STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL data_out_esp_status:STD_LOGIC_VECTOR(7 downto 0);
begin
 --   process(wrtempBMP180)
 --   begin
 --   end process;
    
--    process(rdtempBMP180)
--    begin 
--    end process;
    
 --   process(wrpressureBMP180)
--    begin 
--    end process;
    
--    process(rdpressureBMP180)
--    begin
--    end process;
    
 --   process(wrSHT85)
 --   begin
  --  end process;
     
 --   process(rdSHT85)
 --   begin
--    end process;
    
 --   process(wrTC74)
 --   begin
 --   end process;
    
 --   process(rdTC74)
  --  begin
  --  end process;
    
 --   process(wrYL83)
 --   begin
 --   end process;
    
  --  process(rdYL83)
   -- begin
   -- end process; 
       
    --process
   -- begin
  --  loop
  --  wrtempBMP180<= wrtempBMP180+1;
  --  wait for 10 ms;
  --  rdtempBMP180<= rdtempBMP180+1;
 --   addr_ram_user<=addr_ram_status;
  --  wait for 10 ms;
 --   wrpressureBMP180 <= wrpressureBMP180+1;
 --   wait for 10 ms;
 --   rdpressureBMP180<= rdpressureBMP180+1;
 --   addr_ram_user<=addr_ram_status;
 --   wait for 10 ms;
 --   wrSHT85<=wrSHT85+1;
 --   wait for 10 ms;
 --   rdSHT85<=rdSHT85+1;
 --   addr_ram_user<=addr_ram_status;
  --  wait for 10 ms;
 --   wrTC74<=wrTC74+1;
 --   wait for 10 ms;
 --   rdTC74<=rdTC74+1;
 --   addr_ram_user<=addr_ram_status;
 --   wait for 10 ms;
 --   wrYL83<=wrYL83+1;
 --   wait for 10 ms;
 --   rdYL83<=rdYL83+1;
 --   addr_ram_user<=addr_ram_status;
 --   wait for 10 ms;
 --   end loop;
 --   end process;
    process 
    begin
    ena_status<='1';
    addr_status <= "0000000";
    rw_status<='0';
    data_wr_status<="00101110";
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_wr_user<=data_wr_status;   
    wait for 50 ms;
    ena_status<='0';
    addr_status<="0000000";
    rw_status<='1';
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_in_ram_user<=data_rd_user;
    if(i < 4) then 
    addr_ram_user<=i;
    elsif(i > 3) then i<=0; 
    addr_ram_user<=i; 
    end if;
    data_out_esp_user<=data_rd_user;
    i<=i+1;
    wait for 50 ms; 
    ena_status<='1';
    addr_status <= "0000000";
    rw_status<='0';
    data_wr_status<="00110100";
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_wr_user<=data_wr_status;   
    wait for 50 ms;
    ena_status<='0';
    addr_status<="0000000";
    rw_status<='1';
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_in_ram_user<=data_rd_user;
    if(j < 4) then 
    j<=j+4;
    addr_ram_user<=j;
    elsif (j >7) then j<=4; 
    addr_ram_user<=j; 
    end if;
    data_out_esp_user<=data_rd_user;
    j<=j+1;
    wait for 50 ms;
    ena_status<='1';
    addr_status <= "0000001";
    rw_status<='0';
    data_wr_status<="00100100";
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_wr_user<=data_wr_status; 
    wait for 50 ms;
    ena_status<='0';
    addr_status<="0000001";
    rw_status<='1';
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_in_ram_user<=data_rd_user;
    if(k < 4) then 
    k <= k+8;
    addr_ram_user<=k;
    elsif (k > 11) then k<=8; 
    addr_ram_user<=k; 
    end if;
    data_out_esp_user<=data_rd_user;
    wait for 50ms;
    ena_status<='1';
    addr_status <= "0000010";
    rw_status<='0';
    data_wr_status<="11000011";
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_wr_user<=data_wr_status; 
    wait for 50 ms;
    ena_status<='0';
    addr_status<="0000010";
    rw_status<='1';
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_in_ram_user<=data_rd_user;
    if(l < 4) then 
    l <= l+12;
    addr_ram_user<=l;
    elsif (l > 15) then l<=12; 
    addr_ram_user<=l; 
    end if;
    data_out_esp_user<=data_rd_user;
    wait for 50ms;
    ena_status<='1';
    addr_status <= "0000011";
    rw_status<='0';
    data_wr_status<="01010011";
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_wr_user<=data_wr_status;
    wait for 50ms;
    ena_status<='0';
    addr_status<="0000011";
    rw_status<='1';
    ena_user<=ena_status;
    addr_user<=addr_status;
    rw_user<=rw_status;
    data_in_ram_user<=data_rd_user;
    if(m < 4) then 
    m <= m+16;
    addr_ram_user<=m;
    elsif (m >19) then  m<=16; 
    addr_ram_user<=m; 
    end if;
    data_out_esp_user<=data_rd_user;
    wait for 50ms;
    loop
    end loop;
    end process;
         
end logic;


