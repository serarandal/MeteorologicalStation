----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 10:35:47
-- Design Name: 
-- Module Name: Connections - Behavioral
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

entity Connections is
    GENERIC(
    d_width	:	INTEGER := 8; 
    size		:	INTEGER := 64);
    Port (a: out std_logic_vector( 7 downto 0)
            );
end Connections;

architecture estructural of Connections is
    Component UserSensorLogic PORT (clk_user : out STD_LOGIC ;
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
           data_out_esp_user : out STD_LOGIC_VECTOR (7 downto 0)); END COMPONENT;
    Component i2c_master PORT (clk : IN STD_LOGIC;
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
    Component ram PORT( clk_ram: IN STD_LOGIC;
                        wr_ena	:	IN		STD_LOGIC;
                        addr_ram		:	IN		INTEGER RANGE 0 TO size-1 :=0;
                        data_in_ram	:	IN		STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);
                        data_out_ram	:	OUT	STD_LOGIC_VECTOR(d_width-1 DOWNTO 0)); END COMPONENT;    
   SIGNAL a1 : std_logic;
   SIGNAL a2 : std_logic;
   SIGNAL a3: std_logic;
   SIGNAL a4: std_logic_vector (6 downto 0);
    SIGNAL a5 : std_logic;
   SIGNAL a6 : std_logic_vector (7 downto 0);
   SIGNAL a7: std_logic_vector (7 downto 0);
   SIGNAL a8: std_logic;
   SIGNAL a9 : std_logic;
   SIGNAL a10 : std_logic;
   SIGNAL a11: std_logic;
   SIGNAL a12 : std_logic;
   SIGNAL a13 : std_logic;
   SIGNAL a14: integer:=0;
   SIGNAL a15: std_logic_vector(7 downto 0);
   
begin
        
        UserSensorLogic1 : UserSensorLogic   PORT MAP( clk_user =>a1,
                                                     reset_n_user=>a2,
                                                     ena_user => a3,
                                                     addr_user =>a4,
                                                     rw_user=>a5,
                                                     data_wr_user=>a6,
                                                     data_rd_user=>a7,
                                                     busy_user => a8,
                                                     ack_error_user=>a9,
                                                     sda_user=>a10, 
                                                     scl_user=>a11,
                                                     clk_ram_user=>a12,
                                                     wr_ena_ram_user=>a13,
                                                     addr_ram_user=>a14,
                                                     data_in_ram_user=>a15,
                                                     data_out_esp_user=>a);
        
         i2C_master1 : i2c_master    PORT MAP( clk => a1 ,
                                            reset_n=> a2,
                                            ena => a3,
                                            addr => a4,
                                            rw => a5,
                                            data_wr=> a6,
                                            busy => a8,
                                            data_rd =>a7,
                                            ack_error=>a9,
                                            sda=>a10,
                                            scl=>a11);
                                            
        ram1: ram PORT MAP( clk_ram => a12,
                            wr_ena=>a13,
                            addr_ram=>a14,
                            data_in_ram=>a15,
                            data_out_ram => open);
                                                           
                                                                                                                                                                                                                                                    
end estructural;
