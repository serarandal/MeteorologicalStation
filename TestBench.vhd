----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2020 11:11:18
-- Design Name: 
-- Module Name: TestBench - TestBench_arch
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench is
--  Port ( );
end TestBench;

architecture TestBench_arch of TestBench is
component i2c_master PORT(clk : IN STD_LOGIC;
                               reset_n   : IN     STD_LOGIC;
                               ena       : IN     STD_LOGIC;
                               addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0);
                               rw        : IN     STD_LOGIC;
                               data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0);
                               busy      : OUT    STD_LOGIC;
                               data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0);
                               ack_error : BUFFER STD_LOGIC;
                               sda       : INOUT  STD_LOGIC; 
                               scl       : INOUT  STD_LOGIC );  END COMPONENT;
 SIGNAL clk_s: std_logic:='0';
 SIGNAL reset_n_s:std_logic;
 SIGNAL ena_s: std_logic;
 SIGNAL addr_s:std_logic_vector(6 downto 0);
 SIGNAL rw_s:std_logic;
 SIGNAL data_wr_s:std_logic_vector(7 downto 0);
 SIGNAL busy_s: std_logic;
 SIGNAL data_rd_s:std_logic_vector(7 downto 0);
 SIGNAL ack_error_s: std_logic;
 SIGNAL sda_s : std_logic;
 SIGNAL scl_s : std_logic;
 SIGNAL x : integer :=0;                               
begin
    i2c: i2c_master PORT MAP
    (clk=>clk_S,
     reset_n=> reset_n_S,
     ena=>ena_s,
     addr=>addr_s,
     rw=>rw_s,
     data_wr=>data_wr_s,
     busy=>busy_s,
     data_rd=>data_rd_s,
     ack_error=>ack_error_s,
     sda=>sda_s,
     scl=>scl_s
    );
    
    estimulos: PROCESS
    BEGIN 
    reset_n_s<='0';
    ena_s<='1';
    addr_s<="0000000";
    rw_s<='0';
    data_wr_s<="01010101";
    wait for 500 ms;
    reset_n_s<='0';
    ena_s <= '0' ;
    addr_s<="0000000";
    rw_s<='1';
    wait for 500 ms;
    END PROCESS;
end TestBench_arch;
