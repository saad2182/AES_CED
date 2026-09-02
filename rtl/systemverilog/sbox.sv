
module sbox(
  input      [7:0] In_DI,
  output reg [7:0] Out_DO//,
  //output           Parity
);
wire Parity;
assign Parity = Out_DO[0] ^ Out_DO[1] ^ Out_DO[2] ^ Out_DO[3] ^ Out_DO[4] ^ Out_DO[5] ^ Out_DO[6] ^ Out_DO[7];

  always@(*) begin
  
    case(In_DI)

      8'h00: Out_DO <= 8'h63;
      8'h01: Out_DO <= 8'h7c;
      8'h02: Out_DO <= 8'h77;
      8'h03: Out_DO <= 8'h7b;
      8'h04: Out_DO <= 8'hf2;
      8'h05: Out_DO <= 8'h6b;
      8'h06: Out_DO <= 8'h6f;
      8'h07: Out_DO <= 8'hc5;
      8'h08: Out_DO <= 8'h30;
      8'h09: Out_DO <= 8'h01;
      8'h0A: Out_DO <= 8'h67;
      8'h0B: Out_DO <= 8'h2b;
      8'h0C: Out_DO <= 8'hfe;
      8'h0D: Out_DO <= 8'hd7;
      8'h0E: Out_DO <= 8'hab;
      8'h0F: Out_DO <= 8'h76;

      8'h10: Out_DO <= 8'hca;
      8'h11: Out_DO <= 8'h82;
      8'h12: Out_DO <= 8'hc9;
      8'h13: Out_DO <= 8'h7d;
      8'h14: Out_DO <= 8'hfa;
      8'h15: Out_DO <= 8'h59;
      8'h16: Out_DO <= 8'h47;
      8'h17: Out_DO <= 8'hf0;
      8'h18: Out_DO <= 8'had;
      8'h19: Out_DO <= 8'hd4;
      8'h1A: Out_DO <= 8'ha2;
      8'h1B: Out_DO <= 8'haf;
      8'h1C: Out_DO <= 8'h9c;
      8'h1D: Out_DO <= 8'ha4;
      8'h1E: Out_DO <= 8'h72;
      8'h1F: Out_DO <= 8'hc0;

      8'h20: Out_DO <= 8'hb7;
      8'h21: Out_DO <= 8'hfd;
      8'h22: Out_DO <= 8'h93;
      8'h23: Out_DO <= 8'h26;
      8'h24: Out_DO <= 8'h36;
      8'h25: Out_DO <= 8'h3f;
      8'h26: Out_DO <= 8'hf7;
      8'h27: Out_DO <= 8'hcc;
      8'h28: Out_DO <= 8'h34;
      8'h29: Out_DO <= 8'ha5;
      8'h2A: Out_DO <= 8'he5;
      8'h2B: Out_DO <= 8'hf1;
      8'h2C: Out_DO <= 8'h71;
      8'h2D: Out_DO <= 8'hd8;
      8'h2E: Out_DO <= 8'h31;
      8'h2F: Out_DO <= 8'h15;

      8'h30: Out_DO <= 8'h04;
      8'h31: Out_DO <= 8'hc7;
      8'h32: Out_DO <= 8'h23;
      8'h33: Out_DO <= 8'hc3;
      8'h34: Out_DO <= 8'h18;
      8'h35: Out_DO <= 8'h96;
      8'h36: Out_DO <= 8'h05;
      8'h37: Out_DO <= 8'h9a;
      8'h38: Out_DO <= 8'h07;
      8'h39: Out_DO <= 8'h12;
      8'h3A: Out_DO <= 8'h80;
      8'h3B: Out_DO <= 8'he2;
      8'h3C: Out_DO <= 8'heb;
      8'h3D: Out_DO <= 8'h27;
      8'h3E: Out_DO <= 8'hb2;
      8'h3F: Out_DO <= 8'h75;

      8'h40: Out_DO <= 8'h09;
      8'h41: Out_DO <= 8'h83;
      8'h42: Out_DO <= 8'h2c;
      8'h43: Out_DO <= 8'h1a;
      8'h44: Out_DO <= 8'h1b;
      8'h45: Out_DO <= 8'h6e;
      8'h46: Out_DO <= 8'h5a;
      8'h47: Out_DO <= 8'ha0;
      8'h48: Out_DO <= 8'h52;
      8'h49: Out_DO <= 8'h3b;
      8'h4A: Out_DO <= 8'hd6;
      8'h4B: Out_DO <= 8'hb3;
      8'h4C: Out_DO <= 8'h29;
      8'h4D: Out_DO <= 8'he3;
      8'h4E: Out_DO <= 8'h2f;
      8'h4F: Out_DO <= 8'h84;

      8'h50: Out_DO <= 8'h53;
      8'h51: Out_DO <= 8'hd1;
      8'h52: Out_DO <= 8'h00;
      8'h53: Out_DO <= 8'hed;
      8'h54: Out_DO <= 8'h20;
      8'h55: Out_DO <= 8'hfc;
      8'h56: Out_DO <= 8'hb1;
      8'h57: Out_DO <= 8'h5b;
      8'h58: Out_DO <= 8'h6a;
      8'h59: Out_DO <= 8'hcb;
      8'h5A: Out_DO <= 8'hbe;
      8'h5B: Out_DO <= 8'h39;
      8'h5C: Out_DO <= 8'h4a;
      8'h5D: Out_DO <= 8'h4c;
      8'h5E: Out_DO <= 8'h58;
      8'h5F: Out_DO <= 8'hcf;

      8'h60: Out_DO <= 8'hd0;
      8'h61: Out_DO <= 8'hef;
      8'h62: Out_DO <= 8'haa;
      8'h63: Out_DO <= 8'hfb;
      8'h64: Out_DO <= 8'h43;
      8'h65: Out_DO <= 8'h4d;
      8'h66: Out_DO <= 8'h33;
      8'h67: Out_DO <= 8'h85;
      8'h68: Out_DO <= 8'h45;
      8'h69: Out_DO <= 8'hf9;
      8'h6A: Out_DO <= 8'h02;
      8'h6B: Out_DO <= 8'h7f;
      8'h6C: Out_DO <= 8'h50;
      8'h6D: Out_DO <= 8'h3c;
      8'h6E: Out_DO <= 8'h9f;
      8'h6F: Out_DO <= 8'ha8;

      8'h70: Out_DO <= 8'h51;
      8'h71: Out_DO <= 8'ha3;
      8'h72: Out_DO <= 8'h40;
      8'h73: Out_DO <= 8'h8f;
      8'h74: Out_DO <= 8'h92;
      8'h75: Out_DO <= 8'h9d;
      8'h76: Out_DO <= 8'h38;
      8'h77: Out_DO <= 8'hf5;
      8'h78: Out_DO <= 8'hbc;
      8'h79: Out_DO <= 8'hb6;
      8'h7A: Out_DO <= 8'hda;
      8'h7B: Out_DO <= 8'h21;
      8'h7C: Out_DO <= 8'h10;
      8'h7D: Out_DO <= 8'hff;
      8'h7E: Out_DO <= 8'hf3;
      8'h7F: Out_DO <= 8'hd2;

      8'h80: Out_DO <= 8'hcd;
      8'h81: Out_DO <= 8'h0c;
      8'h82: Out_DO <= 8'h13;
      8'h83: Out_DO <= 8'hec;
      8'h84: Out_DO <= 8'h5f;
      8'h85: Out_DO <= 8'h97;
      8'h86: Out_DO <= 8'h44;
      8'h87: Out_DO <= 8'h17;
      8'h88: Out_DO <= 8'hc4;
      8'h89: Out_DO <= 8'ha7;
      8'h8A: Out_DO <= 8'h7e;
      8'h8B: Out_DO <= 8'h3d;
      8'h8C: Out_DO <= 8'h64;
      8'h8D: Out_DO <= 8'h5d;
      8'h8E: Out_DO <= 8'h19;
      8'h8F: Out_DO <= 8'h73;

      8'h90: Out_DO <= 8'h60;
      8'h91: Out_DO <= 8'h81;
      8'h92: Out_DO <= 8'h4f;
      8'h93: Out_DO <= 8'hdc;
      8'h94: Out_DO <= 8'h22;
      8'h95: Out_DO <= 8'h2a;
      8'h96: Out_DO <= 8'h90;
      8'h97: Out_DO <= 8'h88;
      8'h98: Out_DO <= 8'h46;
      8'h99: Out_DO <= 8'hee;
      8'h9A: Out_DO <= 8'hb8;
      8'h9B: Out_DO <= 8'h14;
      8'h9C: Out_DO <= 8'hde;
      8'h9D: Out_DO <= 8'h5e;
      8'h9E: Out_DO <= 8'h0b;
      8'h9F: Out_DO <= 8'hdb;

      8'ha0: Out_DO <= 8'he0;
      8'ha1: Out_DO <= 8'h32;
      8'ha2: Out_DO <= 8'h3a;
      8'ha3: Out_DO <= 8'h0a;
      8'ha4: Out_DO <= 8'h49;
      8'ha5: Out_DO <= 8'h06;
      8'ha6: Out_DO <= 8'h24;
      8'ha7: Out_DO <= 8'h5c;
      8'ha8: Out_DO <= 8'hc2;
      8'ha9: Out_DO <= 8'hd3;
      8'haA: Out_DO <= 8'hac;
      8'haB: Out_DO <= 8'h62;
      8'haC: Out_DO <= 8'h91;
      8'haD: Out_DO <= 8'h95;
      8'haE: Out_DO <= 8'he4;
      8'haF: Out_DO <= 8'h79;

      8'hb0: Out_DO <= 8'he7;
      8'hb1: Out_DO <= 8'hc8;
      8'hb2: Out_DO <= 8'h37;
      8'hb3: Out_DO <= 8'h6d;
      8'hb4: Out_DO <= 8'h8d;
      8'hb5: Out_DO <= 8'hd5;
      8'hb6: Out_DO <= 8'h4e;
      8'hb7: Out_DO <= 8'ha9;
      8'hb8: Out_DO <= 8'h6c;
      8'hb9: Out_DO <= 8'h56;
      8'hbA: Out_DO <= 8'hf4;
      8'hbB: Out_DO <= 8'hea;
      8'hbC: Out_DO <= 8'h65;
      8'hbD: Out_DO <= 8'h7a;
      8'hbE: Out_DO <= 8'hae;
      8'hbF: Out_DO <= 8'h08;

      8'hc0: Out_DO <= 8'hba;
      8'hc1: Out_DO <= 8'h78;
      8'hc2: Out_DO <= 8'h25;
      8'hc3: Out_DO <= 8'h2e;
      8'hc4: Out_DO <= 8'h1c;
      8'hc5: Out_DO <= 8'ha6;
      8'hc6: Out_DO <= 8'hb4;
      8'hc7: Out_DO <= 8'hc6;
      8'hc8: Out_DO <= 8'he8;
      8'hc9: Out_DO <= 8'hdd;
      8'hcA: Out_DO <= 8'h74;
      8'hcB: Out_DO <= 8'h1f;
      8'hcC: Out_DO <= 8'h4b;
      8'hcD: Out_DO <= 8'hbd;
      8'hcE: Out_DO <= 8'h8b;
      8'hcF: Out_DO <= 8'h8a;

      8'hd0: Out_DO <= 8'h70;
      8'hd1: Out_DO <= 8'h3e;
      8'hd2: Out_DO <= 8'hb5;
      8'hd3: Out_DO <= 8'h66;
      8'hd4: Out_DO <= 8'h48;
      8'hd5: Out_DO <= 8'h03;
      8'hd6: Out_DO <= 8'hf6;
      8'hd7: Out_DO <= 8'h0e;
      8'hd8: Out_DO <= 8'h61;
      8'hd9: Out_DO <= 8'h35;
      8'hdA: Out_DO <= 8'h57;
      8'hdB: Out_DO <= 8'hb9;
      8'hdC: Out_DO <= 8'h86;
      8'hdD: Out_DO <= 8'hc1;
      8'hdE: Out_DO <= 8'h1d;
      8'hdF: Out_DO <= 8'h9e;

      8'he0: Out_DO <= 8'he1;
      8'he1: Out_DO <= 8'hf8;
      8'he2: Out_DO <= 8'h98;
      8'he3: Out_DO <= 8'h11;
      8'he4: Out_DO <= 8'h69;
      8'he5: Out_DO <= 8'hd9;
      8'he6: Out_DO <= 8'h8e;
      8'he7: Out_DO <= 8'h94;
      8'he8: Out_DO <= 8'h9b;
      8'he9: Out_DO <= 8'h1e;
      8'heA: Out_DO <= 8'h87;
      8'heB: Out_DO <= 8'he9;
      8'heC: Out_DO <= 8'hce;
      8'heD: Out_DO <= 8'h55;
      8'heE: Out_DO <= 8'h28;
      8'heF: Out_DO <= 8'hdf;

      8'hf0: Out_DO <= 8'h8c;
      8'hf1: Out_DO <= 8'ha1;
      8'hf2: Out_DO <= 8'h89;
      8'hf3: Out_DO <= 8'h0d;
      8'hf4: Out_DO <= 8'hbf;
      8'hf5: Out_DO <= 8'he6;
      8'hf6: Out_DO <= 8'h42;
      8'hf7: Out_DO <= 8'h68;
      8'hf8: Out_DO <= 8'h41;
      8'hf9: Out_DO <= 8'h99;
      8'hfA: Out_DO <= 8'h2d;
      8'hfB: Out_DO <= 8'h0f;
      8'hfC: Out_DO <= 8'hb0;
      8'hfD: Out_DO <= 8'h54;
      8'hfE: Out_DO <= 8'hbb;
      8'hfF: Out_DO <= 8'h16;

      default: Out_DO <= 8'h00;
	  
    endcase
	
  end

endmodule
