module fourbitcomparator(a,b,eq1);
    input [3:0]a,b;
    output eq1;
    wire w1,w2,w3,w4,w5,w6;
    //Gate Level
    xnor(w1,a[0],b[0]);
    xnor(w2,a[1],b[1]);
    xnor(w3,a[2],b[2]);
    xnor(w4,a[3],b[3]);
    and(w5,w1,w2);
    and(w6,w3,w4);
    and(eq1,w5,w6);


endmodule

module encoder(i,y);
    input [9:0]i;
    output [3:0]y;
    
    or o1(y[3],i[9],i[8]);
    or o2(y[2],i[7],i[6],i[5],i[4]);
    or o3(y[1],i[7],i[6],i[3],i[2]);
    or o4(y[0],i[9],i[7],i[5],i[3],i[1]);
endmodule








module lock(a1,a2,a3,a4,locki);


    
    
    input [9:0]a1;
    input [9:0]a2;
    input [9:0]a3;
    input [9:0]a4;
    output locki;


    
    
    wire [3:0]digi1;
    wire [3:0]digi2;
    wire [3:0]digi3;
    wire [3:0]digi4;
    encoder o1(a1,digi1);
    encoder o2(a2,digi2);
    encoder o3(a3,digi3);
    encoder o4(a4,digi4);
    wire [3:0] pass1;
    assign pass1=4'b0000;
    
    wire [3:0] pass2;
    assign pass2=4'b1001;
    
    wire [3:0] pass3;
    assign pass3=4'b0011;
    
    wire [3:0] pass4;
    assign pass4=4'b0001;
    wire temp1,temp2,temp3,temp4;
    fourbitcomparator g1(pass1,digi1,temp1);
    fourbitcomparator g2(pass2,digi2,temp2);
    fourbitcomparator g3(pass3,digi3,temp3);
    fourbitcomparator g4(pass4,digi4,temp4);
    and g5(locki,temp1,temp2,temp3,temp4);
    endmodule



    





