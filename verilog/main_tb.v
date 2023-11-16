module tb;
    reg [9:0]a1;
    reg [9:0]a2;
    reg [9:0]a3;
    reg [9:0]a4;
    wire locki;
    lock dut(a1,a2,a3,a4,locki);
    initial
        begin
        $display("1-correct password 0-wrong password");
        $monitor("a1=%b a2=%b a3=%b a4=%b locki=%b",a1,a2,a3,a4,locki);
        a1=1; a2=512; a3=8; a4=2; #5
        a1=256; a2=256; a3=1; a4=8; #5
        a1=512; a2=1; a3=2; a4=128; #5
        a1=256; a2=2; a3=1; a4=64; #5
        a1=256; a2=36; a3=512; a4=36; #5
        $finish;
        end
    endmodule

