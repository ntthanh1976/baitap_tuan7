<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebQLHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <div class="form-inline">
        chọn danh mục:<asp:DropDownList ID="ddlLoai" runat="server" DataSourceID="dstheloai" DataTextField="TenLoai" DataValueField="MaLoai" AutoPostBack="true"></asp:DropDownList>
    </div>--%>


    <%--<div class="row mt-2">
        <asp:Repeater ID="rqtHoa" runat="server" DataSourceID="dshoa">
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

         <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                 <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>"style="width:200px;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval("TenHoa") %><br/>
                    Giá bán: <span class="price"><%# Eval("Gia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" CommandArgument='<%# Eval("Mahoa") %>' class="btn btn-success"
                        OnClick="btnAddToCard_Click"  />
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
                    Trang <asp:DataPager ID="dpHoa" runat="server" PageSize="6" >
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>
    


    <asp:SqlDataSource ID="dstheloai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]">
</asp:SqlDataSource>

    <asp:SqlDataSource ID="dshoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>          
            <asp:QueryStringParameter DefaultValue="1" Name="MaLoai" QueryStringField="catid" Type="Int32" />          
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
