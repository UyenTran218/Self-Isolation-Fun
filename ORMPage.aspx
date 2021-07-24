<%@ Page Title="EF Model Binding Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORMPage.aspx.cs" Inherits="Assignment1.ORMPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    
     <h2 class="text-center">BEST THINGS TO DO IN QUARANTINE TIME</h2>
    <div class="form-group">
        <div class="col-4">
        <asp:TextBox runat="server" ID="TBSearch" CssClass="form-control" placeholder="Search Activity ..."></asp:TextBox>

        </div>
        <div class="col-2">
        <button type="submit" class="btn btn-primary">Search</button>

        </div>
    </div>
    <div class="row">
    <asp:Repeater ID="RThingToDoList" runat="server"
        EnableViewState="false"
        SelectMethod="RThingToDo_GetData"
        ItemType ="Assignment1.Models.ThingsToDo">    
      <ItemTemplate>
        <div class="col-md-4 itemContainer">
        <div class="col-md-10 col-md-offset-1 item">
        <h4 class="text-center"><%# Item.id %></h4>
        <p class="text-center">
            <em>
                <%# Item.thingToDo %>
              <span>on <%# Item.Date.Date1 %></span>
            </em>           
        </p>
            <a href="DetailPage.aspx?id=<%# Item.id %>" target="_blank">
            <img class="img-thumbnail" runat="server" src='<%# Item.image%>' alt='<%# Item.thingToDo + " image" %>' style="width:100%" />
            </a>

        </div>
        </div>      
      </ItemTemplate>
    </asp:Repeater>  
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPScript" runat="server">
</asp:Content>
