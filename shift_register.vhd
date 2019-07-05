library ieee;
use ieee.std_logic_1164.all;
---------------------------------------------------
entity shift_register is
	
	generic( N	: natural := 11);
	port( 
		dout_sft: out std_logic;
		din_sft : in  std_logic_vector(N-1 downto 0);
		load_sft: in  std_logic;
		rst_sft : in  std_logic;
		clk_sft : in  std_logic
	);
end shift_register;
---------------------------------------------------
architecture v1 of shift_register is
begin

	process (clk_sft, rst_sft)
		variable q: std_logic_vector(N-1 downto 0);
	begin
		if(rst_sft = '1') then
			q := (others => '1');
		elsif (rising_edge(clk_sft)) then
			if (load_sft = '1') then
				q := din_sft;
			else 
				q := '1' & q(N-1 downto 1);
			end if;
		end if;
		dout_sft <= q(0);
	end process;

end v1;
---------------------------------------------------


