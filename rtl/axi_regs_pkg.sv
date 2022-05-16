// -----------------------------------------------------------------------------
// 'foo' Register Definitions
// Revision: 34
// -----------------------------------------------------------------------------
// Generated on 2022-05-12 at 05:10 (UTC) by airhdl version 2022.04.1-119
// -----------------------------------------------------------------------------
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
// -----------------------------------------------------------------------------

package axi_regs_pkg;


    // Revision number of the 'foo' register map
    localparam AXI_REVISION = 34;

    // Default base address of the 'foo' register map
    localparam logic [31:0] AXI_DEFAULT_BASEADDR = 32'h00000000;

    // Size of the 'foo' register map, in bytes
    localparam AXI_RANGE_BYTES = 128;

    // Register 'reg0'
    localparam logic [31:0] REG0_OFFSET = 32'h00000000; // address offset of the 'reg0' register
    // Field 'reg0.value'
    localparam REG0_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG0_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG0_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg1'
    localparam logic [31:0] REG1_OFFSET = 32'h00000004; // address offset of the 'reg1' register
    // Field 'reg1.value'
    localparam REG1_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG1_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG1_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg2'
    localparam logic [31:0] REG2_OFFSET = 32'h00000008; // address offset of the 'reg2' register
    // Field 'reg2.value'
    localparam REG2_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG2_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG2_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg3'
    localparam logic [31:0] REG3_OFFSET = 32'h0000000C; // address offset of the 'reg3' register
    // Field 'reg3.value'
    localparam REG3_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG3_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG3_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg4'
    localparam logic [31:0] REG4_OFFSET = 32'h00000010; // address offset of the 'reg4' register
    // Field 'reg4.value'
    localparam REG4_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG4_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG4_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg5'
    localparam logic [31:0] REG5_OFFSET = 32'h00000014; // address offset of the 'reg5' register
    // Field 'reg5.value'
    localparam REG5_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG5_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG5_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg6'
    localparam logic [31:0] REG6_OFFSET = 32'h00000018; // address offset of the 'reg6' register
    // Field 'reg6.value'
    localparam REG6_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG6_VALUE_BIT_WIDTH = 1; // bit width of the 'value' field
    localparam logic [0:0] REG6_VALUE_RESET = 1'b0; // reset value of the 'value' field

    // Register 'reg7'
    localparam logic [31:0] REG7_OFFSET = 32'h0000001C; // address offset of the 'reg7' register
    // Field 'reg7.value'
    localparam REG7_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG7_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG7_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg8'
    localparam logic [31:0] REG8_OFFSET = 32'h00000020; // address offset of the 'reg8' register
    // Field 'reg8.value'
    localparam REG8_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG8_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG8_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg9'
    localparam logic [31:0] REG9_OFFSET = 32'h00000024; // address offset of the 'reg9' register
    // Field 'reg9.value'
    localparam REG9_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG9_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG9_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg10'
    localparam logic [31:0] REG10_OFFSET = 32'h00000028; // address offset of the 'reg10' register
    // Field 'reg10.value'
    localparam REG10_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG10_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG10_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg11'
    localparam logic [31:0] REG11_OFFSET = 32'h0000002C; // address offset of the 'reg11' register
    // Field 'reg11.value'
    localparam REG11_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG11_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG11_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg12'
    localparam logic [31:0] REG12_OFFSET = 32'h00000030; // address offset of the 'reg12' register
    // Field 'reg12.value'
    localparam REG12_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG12_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG12_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg13'
    localparam logic [31:0] REG13_OFFSET = 32'h00000034; // address offset of the 'reg13' register
    // Field 'reg13.value'
    localparam REG13_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG13_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG13_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg14'
    localparam logic [31:0] REG14_OFFSET = 32'h00000038; // address offset of the 'reg14' register
    // Field 'reg14.value'
    localparam REG14_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG14_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG14_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg15'
    localparam logic [31:0] REG15_OFFSET = 32'h0000003C; // address offset of the 'reg15' register
    // Field 'reg15.value'
    localparam REG15_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG15_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG15_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg16'
    localparam logic [31:0] REG16_OFFSET = 32'h00000040; // address offset of the 'reg16' register
    // Field 'reg16.value'
    localparam REG16_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG16_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG16_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg17'
    localparam logic [31:0] REG17_OFFSET = 32'h00000044; // address offset of the 'reg17' register
    // Field 'reg17.value'
    localparam REG17_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG17_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG17_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg18'
    localparam logic [31:0] REG18_OFFSET = 32'h00000048; // address offset of the 'reg18' register
    // Field 'reg18.value'
    localparam REG18_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG18_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG18_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg19'
    localparam logic [31:0] REG19_OFFSET = 32'h0000004C; // address offset of the 'reg19' register
    // Field 'reg19.value'
    localparam REG19_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG19_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG19_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg20'
    localparam logic [31:0] REG20_OFFSET = 32'h00000050; // address offset of the 'reg20' register
    // Field 'reg20.value'
    localparam REG20_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG20_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG20_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg21'
    localparam logic [31:0] REG21_OFFSET = 32'h00000054; // address offset of the 'reg21' register
    // Field 'reg21.value'
    localparam REG21_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG21_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG21_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg22'
    localparam logic [31:0] REG22_OFFSET = 32'h00000058; // address offset of the 'reg22' register
    // Field 'reg22.value'
    localparam REG22_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG22_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG22_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg23'
    localparam logic [31:0] REG23_OFFSET = 32'h0000005C; // address offset of the 'reg23' register
    // Field 'reg23.value'
    localparam REG23_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG23_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG23_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg24'
    localparam logic [31:0] REG24_OFFSET = 32'h00000060; // address offset of the 'reg24' register
    // Field 'reg24.value'
    localparam REG24_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG24_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG24_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg25'
    localparam logic [31:0] REG25_OFFSET = 32'h00000064; // address offset of the 'reg25' register
    // Field 'reg25.value'
    localparam REG25_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG25_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG25_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg26'
    localparam logic [31:0] REG26_OFFSET = 32'h00000068; // address offset of the 'reg26' register
    // Field 'reg26.value'
    localparam REG26_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG26_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG26_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg27'
    localparam logic [31:0] REG27_OFFSET = 32'h0000006C; // address offset of the 'reg27' register
    // Field 'reg27.value'
    localparam REG27_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG27_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG27_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg28'
    localparam logic [31:0] REG28_OFFSET = 32'h00000070; // address offset of the 'reg28' register
    // Field 'reg28.value'
    localparam REG28_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG28_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG28_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg29'
    localparam logic [31:0] REG29_OFFSET = 32'h00000074; // address offset of the 'reg29' register
    // Field 'reg29.value'
    localparam REG29_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG29_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG29_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg30'
    localparam logic [31:0] REG30_OFFSET = 32'h00000078; // address offset of the 'reg30' register
    // Field 'reg30.value'
    localparam REG30_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG30_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG30_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

    // Register 'reg31'
    localparam logic [31:0] REG31_OFFSET = 32'h0000007C; // address offset of the 'reg31' register
    // Field 'reg31.value'
    localparam REG31_VALUE_BIT_OFFSET = 0; // bit offset of the 'value' field
    localparam REG31_VALUE_BIT_WIDTH = 32; // bit width of the 'value' field
    localparam logic [31:0] REG31_VALUE_RESET = 32'b00000000000000000000000000000000; // reset value of the 'value' field

endpackage: axi_regs_pkg
