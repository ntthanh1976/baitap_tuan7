<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebQLHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-inline mb-2 mr-2">
        Giá bán từ 
        <asp:TextBox ID="txtGiaTu" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvgiatu" runat="server" ErrorMessage="chưa nhập giá từ" ForeColor="#FF3300" ControlToValidate="txtGiaTu">{*}</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cpvGiaTu" runat="server" ErrorMessage="Nhập sai dữ liệu " ForeColor="Red" ControlToCompare="txtGiaTu" ControlToValidate="txtDenGia" Operator="GreaterThanEqual">(*)</asp:CompareValidator>
        Đến 
        <asp:TextBox ID="txtDenGia" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnTraCuu" runat="server" Text="Tìm Kiếm"  CssClass="btn btn-success"/>
        <asp:RequiredFieldValidator ID="rfvdengia" runat="server" ErrorMessage="chưa nhập dến giá" ForeColor="#FF3300" ControlToValidate="txtDenGia">{*}</asp:RequiredFieldValidator>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
    </div> 
        <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" DefaultValue="0" />
                <asp:ControlParameter ControlID="txtDenGia" Name="Gia2" PropertyName="Text" Type="Double" DefaultValue="10000000" />
            </SelectParameters>
        </asp:SqlDataSource> 

<%--        <div class="row mt-2">
        <asp:Repeater ID="rqtHoa" runat="server" DataSourceID="dsHoaTheoGia">
            <ItemTemplate>
                <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TenHoa") %><br/>
                    Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" class="btn btn-success"/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
       </div>--%>


        <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoaTheoGia">
            <ItemTemplate>
                 <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TenHoa") %><br/>
                    Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" class="btn btn-success"/>
                </div>
            </ItemTemplate>   
            <EmptyDataTemplate>                          
                          <div class="alert alert-warning">
                                Không có dữ liệu
                          </div>                   
            </EmptyDataTemplate>

            <LayoutTemplate>
                 <div class="row">
                      <div runat="server" id="itemPlaceHolder"></div>
                 </div>
                <div class="text-center w-100 mt-3 pt-3 pb-3">
                    <asp:DataPager ID="dpHoa" runat="server" PageSize="6" >
                        <Fields>
                              <asp:NextPreviousPagerField FirstPageText="Đầu" ShowFirstPageButton="false" 
                                  ShowLastPageButton="false"  LastPageText="Cuối"  
                                  PreviousPageText="Trước" NextPageText="Sau"/>
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
</asp:Content>
