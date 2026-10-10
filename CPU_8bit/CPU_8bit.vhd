
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_8bit is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        Q       : out STD_LOGIC_VECTOR(7 downto 0);
        Z       : out STD_LOGIC;
        PC      : out STD_LOGIC_VECTOR(3 downto 0);
        R_Value : out STD_LOGIC_VECTOR(7 downto 0)
    );
end CPU_8bit;

architecture Behavioral of CPU_8bit is

    -- Component declarations
    component ProgramCounter
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            PC_next : in  STD_LOGIC_VECTOR(3 downto 0);
            PC_out  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component ProgramROM
        Port (
            address     : in  STD_LOGIC_VECTOR(3 downto 0);
            instruction : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    component ALU
        Port (
            ACC        : in  STD_LOGIC_VECTOR(7 downto 0);
            IMM        : in  STD_LOGIC_VECTOR(7 downto 0);
            ALU_Sel    : in  STD_LOGIC_VECTOR(1 downto 0);
            ALU_Result : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component RegisterBank
        Port (
            CLK      : in  STD_LOGIC;
            RESET    : in  STD_LOGIC;
            ACC_Load : in  STD_LOGIC;
            R_Load   : in  STD_LOGIC;
            ACC_Data : in  STD_LOGIC_VECTOR(7 downto 0);
            ACC_Out  : out STD_LOGIC_VECTOR(7 downto 0);
            R_Out    : out STD_LOGIC_VECTOR(7 downto 0);
            Z_Out    : out STD_LOGIC
        );
    end component;

    component ControlUnit
        Port (
            opcode   : in  STD_LOGIC_VECTOR(3 downto 0);
            ACC_Load : out STD_LOGIC;
            R_Load   : out STD_LOGIC;
            ALU_Sel  : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    -- Program counter and instruction
    signal pc_current  : STD_LOGIC_VECTOR(3 downto 0);
    signal pc_next     : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction : STD_LOGIC_VECTOR(11 downto 0);

    -- Instruction fields
    signal opcode    : STD_LOGIC_VECTOR(3 downto 0);
    signal immediate : STD_LOGIC_VECTOR(7 downto 0);

    -- Register outputs
    signal acc_current : STD_LOGIC_VECTOR(7 downto 0);
    signal r_current   : STD_LOGIC_VECTOR(7 downto 0);
    signal z_current   : STD_LOGIC;

    -- ALU and control signals
    signal alu_select : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_load   : STD_LOGIC;
    signal r_load     : STD_LOGIC;
    signal acc_data   : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Program Counter
    PC_Unit : ProgramCounter
        port map (
            CLK     => CLK,
            RESET   => RESET,
            PC_next => pc_next,
            PC_out  => pc_current
        );

    -- Program ROM
    ROM_Unit : ProgramROM
        port map (
            address     => pc_current,
            instruction => instruction
        );

    -- Increment PC after each instruction
    pc_next <= std_logic_vector(unsigned(pc_current) + 1);

    -- Decode instruction fields
    opcode    <= instruction(11 downto 8);
    immediate <= instruction(7 downto 0);

    -- Control Unit
    Control_Unit : ControlUnit
        port map (
            opcode   => opcode,
            ACC_Load => acc_load,
            R_Load   => r_load,
            ALU_Sel  => alu_select
        );

    -- Arithmetic Logic Unit
    ALU_Unit : ALU
        port map (
            ACC        => acc_current,
            IMM        => immediate,
            ALU_Sel    => alu_select,
            ALU_Result => alu_result
        );

    -- Select register R for LDR; otherwise select ALU result
    process(opcode, r_current, alu_result)
    begin
        if opcode = "1011" then
            acc_data <= r_current;
        else
            acc_data <= alu_result;
        end if;
    end process;

    -- Accumulator and R registers
    Registers : RegisterBank
        port map (
            CLK      => CLK,
            RESET    => RESET,
            ACC_Load => acc_load,
            R_Load   => r_load,
            ACC_Data => acc_data,
            ACC_Out  => acc_current,
            R_Out    => r_current,
            Z_Out    => z_current
        );

    -- Top-level outputs
    Q       <= acc_current;
    Z       <= z_current;
    PC      <= pc_current;
    R_Value <= r_current;

end Behavioral;