library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_4bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        SUM  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end adder_4bit;

architecture Dataflow of adder_4bit is
    signal C : STD_LOGIC_VECTOR(4 downto 0);
begin

    C(0) <= '0';

    C(1) <= (A(0) and B(0)) or
            (A(0) and C(0)) or
            (B(0) and C(0));

    SUM(0) <= A(0) xor B(0) xor C(0);

    C(2) <= (A(1) and B(1)) or
            (A(1) and C(1)) or
            (B(1) and C(1));

    SUM(1) <= A(1) xor B(1) xor C(1);

    C(3) <= (A(2) and B(2)) or
            (A(2) and C(2)) or
            (B(2) and C(2));

    SUM(2) <= A(2) xor B(2) xor C(2);

    C(4) <= (A(3) and B(3)) or
            (A(3) and C(3)) or
            (B(3) and C(3));

    SUM(3) <= A(3) xor B(3) xor C(3);

end Dataflow;