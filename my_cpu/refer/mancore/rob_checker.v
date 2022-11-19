//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: checker.v
//Author    		: yingzheng
//Date     	 		: 10/6/2021
//Version 	   	: 0.1
//Description   : 
//
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//10/06/2021   yingzheng      0.1        Original
//-------------------------------------------------------------

module rob_checker
#(
  parameter GPR_DW = 64,
  parameter CSR_DW = 64
)(
  input                             rstn                  ,
  input                             clk                   ,

  input                             jump_pc_hit           ,
//WITH GPR
  input         [GPR_DW-1:0]        x0                    ,  
  input         [GPR_DW-1:0]        x1                    ,  
  input         [GPR_DW-1:0]        x2                    ,  
  input         [GPR_DW-1:0]        x3                    ,  
  input         [GPR_DW-1:0]        x4                    ,  
  input         [GPR_DW-1:0]        x5                    ,  
  input         [GPR_DW-1:0]        x6                    ,  
  input         [GPR_DW-1:0]        x7                    ,  
  input         [GPR_DW-1:0]        x8                    ,  
  input         [GPR_DW-1:0]        x9                    ,  
  input         [GPR_DW-1:0]        x10                   ,  
  input         [GPR_DW-1:0]        x11                   ,  
  input         [GPR_DW-1:0]        x12                   ,  
  input         [GPR_DW-1:0]        x13                   ,  
  input         [GPR_DW-1:0]        x14                   ,  
  input         [GPR_DW-1:0]        x15                   ,  
  input         [GPR_DW-1:0]        x16                   ,  
  input         [GPR_DW-1:0]        x17                   ,  
  input         [GPR_DW-1:0]        x18                   ,  
  input         [GPR_DW-1:0]        x19                   ,  
  input         [GPR_DW-1:0]        x20                   ,  
  input         [GPR_DW-1:0]        x21                   ,  
  input         [GPR_DW-1:0]        x22                   ,  
  input         [GPR_DW-1:0]        x23                   ,  
  input         [GPR_DW-1:0]        x24                   ,  
  input         [GPR_DW-1:0]        x25                   ,
  input         [GPR_DW-1:0]        x26                   ,  
  input         [GPR_DW-1:0]        x27                   ,  
  input         [GPR_DW-1:0]        x28                   ,  
  input         [GPR_DW-1:0]        x29                   ,  
  input         [GPR_DW-1:0]        x30                   ,  
  input         [GPR_DW-1:0]        x31                   ,  

// WITH CSR  
  input         [CSR_DW-1:0]        csr_mstatus           ,
  input         [CSR_DW-1:0]        csr_mie               ,
  input         [CSR_DW-1:0]        csr_mip               ,
  input         [CSR_DW-1:0]        csr_mtvec             ,
  input         [CSR_DW-1:0]        csr_mscratch          ,
  input         [CSR_DW-1:0]        csr_mcycle            ,
  input         [CSR_DW-1:0]        csr_minstret          ,
  input         [CSR_DW-1:0]        csr_mepc              ,
  input         [CSR_DW-1:0]        csr_mcause            ,
  input         [CSR_DW-1:0]        csr_mtval             ,
  input         [CSR_DW-1:0]        csr_misa              ,
  input         [CSR_DW-1:0]        csr_mvendorid         ,
  input         [CSR_DW-1:0]        csr_marchid           ,
  input         [CSR_DW-1:0]        csr_mimpid            ,
  input         [CSR_DW-1:0]        csr_mhartid           ,
  input         [CSR_DW-1:0]        csr_dcsr              ,
  input         [CSR_DW-1:0]        csr_dpc               ,
  input         [CSR_DW-1:0]        csr_dscratch          ,

//WITH ROB_GPR
  input        [GPR_DW-1:0]        rob_checker_x0         ,
  input        [GPR_DW-1:0]        rob_checker_x1         ,
  input        [GPR_DW-1:0]        rob_checker_x2         ,
  input        [GPR_DW-1:0]        rob_checker_x3         ,
  input        [GPR_DW-1:0]        rob_checker_x4         ,
  input        [GPR_DW-1:0]        rob_checker_x5         ,
  input        [GPR_DW-1:0]        rob_checker_x6         ,
  input        [GPR_DW-1:0]        rob_checker_x7         ,
  input        [GPR_DW-1:0]        rob_checker_x8         ,
  input        [GPR_DW-1:0]        rob_checker_x9         ,
  input        [GPR_DW-1:0]        rob_checker_x10        ,
  input        [GPR_DW-1:0]        rob_checker_x11        ,
  input        [GPR_DW-1:0]        rob_checker_x12        ,
  input        [GPR_DW-1:0]        rob_checker_x13        ,
  input        [GPR_DW-1:0]        rob_checker_x14        ,
  input        [GPR_DW-1:0]        rob_checker_x15        ,
  input        [GPR_DW-1:0]        rob_checker_x16        ,
  input        [GPR_DW-1:0]        rob_checker_x17        ,
  input        [GPR_DW-1:0]        rob_checker_x18        ,
  input        [GPR_DW-1:0]        rob_checker_x19        ,
  input        [GPR_DW-1:0]        rob_checker_x20        ,
  input        [GPR_DW-1:0]        rob_checker_x21        ,
  input        [GPR_DW-1:0]        rob_checker_x22        ,
  input        [GPR_DW-1:0]        rob_checker_x23        ,
  input        [GPR_DW-1:0]        rob_checker_x24        ,
  input        [GPR_DW-1:0]        rob_checker_x25        ,
  input        [GPR_DW-1:0]        rob_checker_x26        ,
  input        [GPR_DW-1:0]        rob_checker_x27        ,
  input        [GPR_DW-1:0]        rob_checker_x28        ,
  input        [GPR_DW-1:0]        rob_checker_x29        ,
  input        [GPR_DW-1:0]        rob_checker_x30        ,
  input        [GPR_DW-1:0]        rob_checker_x31        ,

//WITH ROB_CSR
  input        [CSR_DW-1:0]        rob_checker_mstatus     ,
  input        [CSR_DW-1:0]        rob_checker_mie         ,
  input        [CSR_DW-1:0]        rob_checker_mip         ,
  input        [CSR_DW-1:0]        rob_checker_mtvec       ,
  input        [CSR_DW-1:0]        rob_checker_mscratch    ,
  input        [CSR_DW-1:0]        rob_checker_mcycle      ,
  input        [CSR_DW-1:0]        rob_checker_minstret    ,
  input        [CSR_DW-1:0]        rob_checker_mepc        ,
  input        [CSR_DW-1:0]        rob_checker_mcause      ,
  input        [CSR_DW-1:0]        rob_checker_mtval       ,
  input        [CSR_DW-1:0]        rob_checker_misa        ,
  input        [CSR_DW-1:0]        rob_checker_mvendorid   ,
  input        [CSR_DW-1:0]        rob_checker_marchid     ,
  input        [CSR_DW-1:0]        rob_checker_mimpid      ,
  input        [CSR_DW-1:0]        rob_checker_mhartid     ,
  input        [CSR_DW-1:0]        rob_checker_dcsr        ,
  input        [CSR_DW-1:0]        rob_checker_dpc         ,
  input        [CSR_DW-1:0]        rob_checker_dscratch    ,
//WITH OITF
  input                            oitf_checker_empty    

);


///////////////////////////////////////////////////////////////////////



// -----------------main code  -----------------------------------------
//GPR
reg        [GPR_DW-1:0]        checker_x0         ;
reg        [GPR_DW-1:0]        checker_x1         ;
reg        [GPR_DW-1:0]        checker_x2         ;
reg        [GPR_DW-1:0]        checker_x3         ;
reg        [GPR_DW-1:0]        checker_x4         ;
reg        [GPR_DW-1:0]        checker_x5         ;
reg        [GPR_DW-1:0]        checker_x6         ;
reg        [GPR_DW-1:0]        checker_x7         ;
reg        [GPR_DW-1:0]        checker_x8         ;
reg        [GPR_DW-1:0]        checker_x9         ;
reg        [GPR_DW-1:0]        checker_x10        ;
reg        [GPR_DW-1:0]        checker_x11        ;
reg        [GPR_DW-1:0]        checker_x12        ;
reg        [GPR_DW-1:0]        checker_x13        ;
reg        [GPR_DW-1:0]        checker_x14        ;
reg        [GPR_DW-1:0]        checker_x15        ;
reg        [GPR_DW-1:0]        checker_x16        ;
reg        [GPR_DW-1:0]        checker_x17        ;
reg        [GPR_DW-1:0]        checker_x18        ;
reg        [GPR_DW-1:0]        checker_x19        ;
reg        [GPR_DW-1:0]        checker_x20        ;
reg        [GPR_DW-1:0]        checker_x21        ;
reg        [GPR_DW-1:0]        checker_x22        ;
reg        [GPR_DW-1:0]        checker_x23        ;
reg        [GPR_DW-1:0]        checker_x24        ;
reg        [GPR_DW-1:0]        checker_x25        ;
reg        [GPR_DW-1:0]        checker_x26        ;
reg        [GPR_DW-1:0]        checker_x27        ;
reg        [GPR_DW-1:0]        checker_x28        ;
reg        [GPR_DW-1:0]        checker_x29        ;
reg        [GPR_DW-1:0]        checker_x30        ;
reg        [GPR_DW-1:0]        checker_x31        ;

//write gpr
always @(posedge clk or negedge rstn) begin
  if(!rstn) begin
    checker_x0   <= {GPR_DW{1'b0}}      ;
    checker_x1   <= {GPR_DW{1'b0}}      ;
    checker_x2   <= {GPR_DW{1'b0}}      ;
    checker_x3   <= {GPR_DW{1'b0}}      ;
    checker_x4   <= {GPR_DW{1'b0}}      ;
    checker_x5   <= {GPR_DW{1'b0}}      ;
    checker_x6   <= {GPR_DW{1'b0}}      ;
    checker_x7   <= {GPR_DW{1'b0}}      ;
    checker_x8   <= {GPR_DW{1'b0}}      ;
    checker_x9   <= {GPR_DW{1'b0}}      ;
    checker_x10  <= {GPR_DW{1'b0}}      ;
    checker_x11  <= {GPR_DW{1'b0}}      ;
    checker_x12  <= {GPR_DW{1'b0}}      ;
    checker_x13  <= {GPR_DW{1'b0}}      ;
    checker_x14  <= {GPR_DW{1'b0}}      ;
    checker_x15  <= {GPR_DW{1'b0}}      ;
    checker_x16  <= {GPR_DW{1'b0}}      ;
    checker_x17  <= {GPR_DW{1'b0}}      ;
    checker_x18  <= {GPR_DW{1'b0}}      ;
    checker_x19  <= {GPR_DW{1'b0}}      ;
    checker_x20  <= {GPR_DW{1'b0}}      ;
    checker_x21  <= {GPR_DW{1'b0}}      ;
    checker_x22  <= {GPR_DW{1'b0}}      ;
    checker_x23  <= {GPR_DW{1'b0}}      ;
    checker_x24  <= {GPR_DW{1'b0}}      ;
    checker_x25  <= {GPR_DW{1'b0}}      ;
    checker_x26  <= {GPR_DW{1'b0}}      ;
    checker_x27  <= {GPR_DW{1'b0}}      ;
    checker_x28  <= {GPR_DW{1'b0}}      ;
    checker_x29  <= {GPR_DW{1'b0}}      ;
    checker_x30  <= {GPR_DW{1'b0}}      ;
    checker_x31  <= {GPR_DW{1'b0}}      ;
  end
  else if(oitf_checker_empty) begin
    checker_x0   <=  x0               ;
    checker_x1   <=  x1               ;
    checker_x2   <=  x2               ;
    checker_x3   <=  x3               ;
    checker_x4   <=  x4               ;
    checker_x5   <=  x5               ;
    checker_x6   <=  x6               ;
    checker_x7   <=  x7               ;
    checker_x8   <=  x8               ;
    checker_x9   <=  x9               ;
    checker_x10  <=  x10              ;
    checker_x11  <=  x11              ;
    checker_x12  <=  x12              ;
    checker_x13  <=  x13              ;
    checker_x14  <=  x14              ;
    checker_x15  <=  x15              ;
    checker_x16  <=  x16              ;
    checker_x17  <=  x17              ;
    checker_x18  <=  x18              ;
    checker_x19  <=  x19              ;
    checker_x20  <=  x20              ;
    checker_x21  <=  x21              ;
    checker_x22  <=  x22              ;
    checker_x23  <=  x23              ;
    checker_x24  <=  x24              ;
    checker_x25  <=  x25              ;
    checker_x26  <=  x26              ;
    checker_x27  <=  x27              ;
    checker_x28  <=  x28              ;
    checker_x29  <=  x29              ;
    checker_x30  <=  x30              ;
    checker_x31  <=  x31              ;
  end
end

//write CSR

reg   [CSR_DW-1:0]         checker_mstatus       ;
reg   [CSR_DW-1:0]         checker_mie           ;
reg   [CSR_DW-1:0]         checker_mip           ;
reg   [CSR_DW-1:0]         checker_mtvec         ;
reg   [CSR_DW-1:0]         checker_mscratch      ;
reg   [CSR_DW-1:0]         checker_mcycle        ;
reg   [CSR_DW-1:0]         checker_minstret      ;
reg   [CSR_DW-1:0]         checker_mepc          ;
reg   [CSR_DW-1:0]         checker_mcause        ;
reg   [CSR_DW-1:0]         checker_mtval         ;
reg   [CSR_DW-1:0]         checker_misa          ;
reg   [CSR_DW-1:0]         checker_mvendorid     ;
reg   [CSR_DW-1:0]         checker_marchid       ;
reg   [CSR_DW-1:0]         checker_mimpid        ;
reg   [CSR_DW-1:0]         checker_mhartid       ;
reg   [CSR_DW-1:0]         checker_dcsr          ;
reg   [CSR_DW-1:0]         checker_dpc           ;
reg   [CSR_DW-1:0]         checker_dscratch      ;

always @(posedge clk or negedge rstn) begin
  if(!rstn) begin
    checker_mstatus         <= {CSR_DW{1'b0}}      ;
    checker_mie             <= {CSR_DW{1'b0}}      ;
    checker_mip             <= {CSR_DW{1'b0}}      ;
    checker_mtvec           <= {CSR_DW{1'b0}}      ;
    checker_mscratch        <= {CSR_DW{1'b0}}      ;
    checker_mcycle          <= {CSR_DW{1'b0}}      ;
    checker_minstret        <= {CSR_DW{1'b0}}      ;
    checker_mepc            <= {CSR_DW{1'b0}}      ;
    checker_mcause          <= {CSR_DW{1'b0}}      ;
    checker_mtval           <= {CSR_DW{1'b0}}      ;
    checker_misa            <= {CSR_DW{1'b0}}      ;
    checker_mvendorid       <= {CSR_DW{1'b0}}      ;
    checker_marchid         <= {CSR_DW{1'b0}}      ;
    checker_mimpid          <= {CSR_DW{1'b0}}      ;
    checker_mhartid         <= {CSR_DW{1'b0}}      ;
    checker_dcsr            <= {CSR_DW{1'b0}}      ;
    checker_dpc             <= {CSR_DW{1'b0}}      ;
    checker_dscratch        <= {CSR_DW{1'b0}}      ;
  end
  else if(oitf_checker_empty) begin
     checker_mstatus       <=    csr_mstatus       ;    
     checker_mie           <=    csr_mie           ;   
     checker_mip           <=    csr_mip           ;
     checker_mtvec         <=    csr_mtvec         ;
     checker_mscratch      <=    csr_mscratch      ;
     checker_mcycle        <=    csr_mcycle        ;
     checker_minstret      <=    csr_minstret      ;
     checker_mepc          <=    csr_mepc          ;
     checker_mcause        <=    csr_mcause        ;
     checker_mtval         <=    csr_mtval         ;
     checker_misa          <=    csr_misa          ;
     checker_mvendorid     <=    csr_mvendorid     ;
     checker_marchid       <=    csr_marchid       ;
     checker_mimpid        <=    csr_mimpid        ;
     checker_mhartid       <=    csr_mhartid       ;
     checker_dcsr          <=    csr_dcsr          ;
     checker_dpc           <=    csr_dpc           ;
     checker_dscratch      <=    csr_dscratch      ;
  end
end

//compare
reg empty_1d;
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    empty_1d <= 1'b0 ;
  else
    empty_1d <= oitf_checker_empty ;
end




//gpr
reg          right_gpr        ;
reg [31:0]   right_gpr_index  ;

wire         right_gpr_x0     =  ( checker_x0  === rob_checker_x0  );
wire         right_gpr_x1     =  ( checker_x1  === rob_checker_x1  );
wire         right_gpr_x2     =  ( checker_x2  === rob_checker_x2  );
wire         right_gpr_x3     =  ( checker_x3  === rob_checker_x3  );
wire         right_gpr_x4     =  ( checker_x4  === rob_checker_x4  );
wire         right_gpr_x5     =  ( checker_x5  === rob_checker_x5  );
wire         right_gpr_x6     =  ( checker_x6  === rob_checker_x6  );
wire         right_gpr_x7     =  ( checker_x7  === rob_checker_x7  );
wire         right_gpr_x8     =  ( checker_x8  === rob_checker_x8  );
wire         right_gpr_x9     =  ( checker_x9  === rob_checker_x9  );
wire         right_gpr_x10    =  ( checker_x10 === rob_checker_x10 );
wire         right_gpr_x11    =  ( checker_x11 === rob_checker_x11 );
wire         right_gpr_x12    =  ( checker_x12 === rob_checker_x12 );
wire         right_gpr_x13    =  ( checker_x13 === rob_checker_x13 );
wire         right_gpr_x14    =  ( checker_x14 === rob_checker_x14 );
wire         right_gpr_x15    =  ( checker_x15 === rob_checker_x15 );
wire         right_gpr_x16    =  ( checker_x16 === rob_checker_x16 );
wire         right_gpr_x17    =  ( checker_x17 === rob_checker_x17 );
wire         right_gpr_x18    =  ( checker_x18 === rob_checker_x18 );
wire         right_gpr_x19    =  ( checker_x19 === rob_checker_x19 );
wire         right_gpr_x20    =  ( checker_x20 === rob_checker_x20 );
wire         right_gpr_x21    =  ( checker_x21 === rob_checker_x21 );
wire         right_gpr_x22    =  ( checker_x22 === rob_checker_x22 );
wire         right_gpr_x23    =  ( checker_x23 === rob_checker_x23 );
wire         right_gpr_x24    =  ( checker_x24 === rob_checker_x24 );
wire         right_gpr_x25    =  ( checker_x25 === rob_checker_x25 );
wire         right_gpr_x26    =  ( checker_x26 === rob_checker_x26 );
wire         right_gpr_x27    =  ( checker_x27 === rob_checker_x27 );
wire         right_gpr_x28    =  ( checker_x28 === rob_checker_x28 );
wire         right_gpr_x29    =  ( checker_x29 === rob_checker_x29 );
wire         right_gpr_x30    =  ( checker_x30 === rob_checker_x30 ); 
wire         right_gpr_x31    =  ( checker_x31 === rob_checker_x31 );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    right_gpr <= 1'b1 ;
  else if(jump_pc_hit)
    right_gpr <= right_gpr_x0  & right_gpr_x1  & right_gpr_x2  & right_gpr_x3  & right_gpr_x4  & right_gpr_x5  & right_gpr_x6  & right_gpr_x7  & right_gpr_x8 & right_gpr_x9 &
                 right_gpr_x10 & right_gpr_x11 & right_gpr_x12 & right_gpr_x13 & right_gpr_x14 & right_gpr_x15 & right_gpr_x16 & right_gpr_x17 & right_gpr_x18& right_gpr_x19&
                 right_gpr_x20 & right_gpr_x21 & right_gpr_x22 & right_gpr_x23 & right_gpr_x24 & right_gpr_x25 & right_gpr_x26 & right_gpr_x27 & right_gpr_x28& right_gpr_x29&
                 right_gpr_x30 & right_gpr_x31;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    right_gpr_index <= 32'hffff_ffff ;
  else if(jump_pc_hit)
    right_gpr_index <= {right_gpr_x0 , right_gpr_x1 , right_gpr_x2 , right_gpr_x3 , right_gpr_x4 , right_gpr_x5 , right_gpr_x6 , right_gpr_x7 , 
                      right_gpr_x8 , right_gpr_x9 , right_gpr_x10, right_gpr_x11, right_gpr_x12, right_gpr_x13, right_gpr_x14, right_gpr_x15, 
                      right_gpr_x16, right_gpr_x17, right_gpr_x18, right_gpr_x19, right_gpr_x20, right_gpr_x21, right_gpr_x22, right_gpr_x23, 
                      right_gpr_x24, right_gpr_x25, right_gpr_x26, right_gpr_x27, right_gpr_x28, right_gpr_x29, right_gpr_x30, right_gpr_x31 };
end

//csr

reg          right_csr        ;

wire         right_csr_mstatus      =  (checker_mstatus      === rob_checker_mstatus      );
//wire         right_csr_mie          =  (checker_mie          === rob_checker_mie          );
//wire         right_csr_mip          =  (checker_mip          === rob_checker_mip          );
//wire         right_csr_mtvec        =  (checker_mtvec        === rob_checker_mtvec        );
//wire         right_csr_mscratch     =  (checker_mscratch     === rob_checker_mscratch     );
//wire         right_csr_mcycle       =  (checker_mcycle       === rob_checker_mcycle       );
//wire         right_csr_minstret     =  (checker_minstret     === rob_checker_minstret     );
wire         right_csr_mepc         =  (checker_mepc         === rob_checker_mepc         );
wire         right_csr_mcause       =  (checker_mcause       === rob_checker_mcause       );
//wire         right_csr_mtval        =  (checker_mtval        === rob_checker_mtval        );
//wire         right_csr_misa         =  (checker_misa         === rob_checker_misa         );
//wire         right_csr_mvendorid    =  (checker_mvendorid    === rob_checker_mvendorid    );
//wire         right_csr_marchid      =  (checker_marchid      === rob_checker_marchid      );
//wire         right_csr_mimpid       =  (checker_mimpid       === rob_checker_mimpid       );
//wire         right_csr_mhartid      =  (checker_mhartid      === rob_checker_mhartid      );
//wire         right_csr_dcsr         =  (checker_dcsr         === rob_checker_dcsr         );
//wire         right_csr_dpc          =  (checker_dpc          === rob_checker_dpc          );
//wire         right_csr_dscratch     =  (checker_dscratch     === rob_checker_dscratch     );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    right_csr <= 1'b1 ;
  else if( jump_pc_hit )
    //right_csr <= right_csr_mstatus  & right_csr_mie    & right_csr_mip      & right_csr_mtvec & right_csr_mscratch & right_csr_mcycle     &
    //             right_csr_minstret & right_csr_mepc   & right_csr_mcause   & right_csr_mtval & right_csr_misa     & right_csr_mvendorid  & 
    //             right_csr_marchid  & right_csr_mimpid & right_csr_mhartid  & right_csr_dcsr  & right_csr_dpc      & right_csr_dscratch     ;
    right_csr <= right_csr_mstatus  & right_csr_mcause    & right_csr_mepc ;

end

endmodule













