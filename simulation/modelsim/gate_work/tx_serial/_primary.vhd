library verilog;
use verilog.vl_types.all;
entity tx_serial is
    port(
        clk_tx          : in     vl_logic;
        rst_tx          : in     vl_logic;
        load_tx         : in     vl_logic;
        sel_paridade_tx : in     vl_logic;
        sel_baudrate_tx : in     vl_logic_vector(1 downto 0);
        out_tx          : out    vl_logic;
        ssd1_tx         : out    vl_logic_vector(6 downto 0);
        ssd2_tx         : out    vl_logic_vector(6 downto 0);
        ssd3_tx         : out    vl_logic_vector(6 downto 0);
        ssd4_tx         : out    vl_logic_vector(6 downto 0);
        ssd5_tx         : out    vl_logic_vector(6 downto 0);
        ssd6_tx         : out    vl_logic_vector(6 downto 0);
        ssd7_tx         : out    vl_logic_vector(6 downto 0);
        ssd8_tx         : out    vl_logic_vector(6 downto 0);
        baudrate_tx     : out    vl_logic;
        led_baudrate_tx1: out    vl_logic;
        led_baudrate_tx2: out    vl_logic;
        led_baudrate_tx3: out    vl_logic;
        led_baudrate_tx4: out    vl_logic
    );
end tx_serial;
