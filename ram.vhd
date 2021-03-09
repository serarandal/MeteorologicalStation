
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ram IS
	GENERIC(
		d_width	:	INTEGER := 8;    --width of each data word
		size		:	INTEGER := 64);  --number of data words the memory can store
	PORT(
		clk_ram		:	IN		STD_LOGIC;                             --system clock
		wr_ena	:	IN		STD_LOGIC;                             --write enable
		addr_ram		:	IN		INTEGER RANGE 0 TO size-1;             --address to write/read
		data_in_ram	:	IN		STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);  --input data to write
		data_out_ram	:	OUT	STD_LOGIC_VECTOR(d_width-1 DOWNTO 0)); --output data read
END ram;

ARCHITECTURE logic OF ram IS
	TYPE memory IS ARRAY(size-1 DOWNTO 0) OF STD_LOGIC_VECTOR(d_width-1 DOWNTO 0);  --data type for memory
	SIGNAL ram			:	memory;                                                    --memory array
	SIGNAL addr_int	:	INTEGER RANGE 0 TO size-1;                                 --internal address register
BEGIN

	PROCESS(clk_ram)
	BEGIN
		IF(clk_ram'EVENT AND clk_ram = '1') THEN

			IF(wr_ena = '1') THEN     --write enable is asserted
				ram(addr_ram) <= data_in_ram;  --write input data into memory
			END IF;
			
			addr_int <= addr_ram;         --store the address in the internal address register

		END IF;	
	END PROCESS;
	
	data_out_ram <= ram(addr_int);      --output data at the stored address
	
END logic;