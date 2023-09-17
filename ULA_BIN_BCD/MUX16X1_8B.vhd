library ieee;
use ieee.std_logic_1164.all;

entity MUX16X1_8B is
    port(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15 : in std_logic_vector(7 downto 0);
         s : in std_logic_vector(3 downto 0);
         q : out std_logic_vector(7 downto 0));
end MUX16X1_8B;

architecture ckt of MUX16X1_8B is

    component MUX16B is
        port(i : in std_logic_vector(15 downto 0);
             s : in std_logic_vector(3 downto 0);
             q : out std_logic);
    end component;

    signal EMUX0,EMUX1,EMUX2,EMUX3,EMUX4,EMUX5,EMUX6,EMUX7: std_logic_vector(15 downto 0);
begin
    EMUX0 <= i15(0) & i14(0) & i13(0) & i12(0) & i11(0) & i10(0) & i9(0) & i8(0) & i7(0) & i6(0) & i5(0) & i4(0) & i3(0) & i2(0) & i1(0) & i0(0);
    EMUX1 <= i15(1) & i14(1) & i13(1) & i12(1) & i11(1) & i10(1) & i9(1) & i8(1) & i7(1) & i6(1) & i5(1) & i4(1) & i3(1) & i2(1) & i1(1) & i0(1);
    EMUX2 <= i15(2) & i14(2) & i13(2) & i12(2) & i11(2) & i10(2) & i9(2) & i8(2) & i7(2) & i6(2) & i5(2) & i4(2) & i3(2) & i2(2) & i1(2) & i0(2);
    EMUX3 <= i15(3) & i14(3) & i13(3) & i12(3) & i11(3) & i10(3) & i9(3) & i8(3) & i7(3) & i6(3) & i5(3) & i4(3) & i3(3) & i2(3) & i1(3) & i0(3);
    EMUX4 <= i15(4) & i14(4) & i13(4) & i12(4) & i11(4) & i10(4) & i9(4) & i8(4) & i7(4) & i6(4) & i5(4) & i4(4) & i3(4) & i2(4) & i1(4) & i0(4);
    EMUX5 <= i15(5) & i14(5) & i13(5) & i12(5) & i11(5) & i10(5) & i9(5) & i8(5) & i7(5) & i6(5) & i5(5) & i4(5) & i3(5) & i2(5) & i1(5) & i0(5);
    EMUX6 <= i15(6) & i14(6) & i13(6) & i12(6) & i11(6) & i10(6) & i9(6) & i8(6) & i7(6) & i6(6) & i5(6) & i4(6) & i3(6) & i2(6) & i1(6) & i0(6);
    EMUX7 <= i15(7) & i14(7) & i13(7) & i12(7) & i11(7) & i10(7) & i9(7) & i8(7) & i7(7) & i6(7) & i5(7) & i4(7) & i3(7) & i2(7) & i1(7) & i0(7);

    MUX0: MUX16B port map(EMUX0,s,q(0));
    MUX1: MUX16B port map(EMUX1,s,q(1));
    MUX2: MUX16B port map(EMUX2,s,q(2));
    MUX3: MUX16B port map(EMUX3,s,q(3));
    MUX4: MUX16B port map(EMUX4,s,q(4));
    MUX5: MUX16B port map(EMUX5,s,q(5));
    MUX6: MUX16B port map(EMUX6,s,q(6));
    MUX7: MUX16B port map(EMUX7,s,q(7));

end ckt;
