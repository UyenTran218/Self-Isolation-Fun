<%@ Page Title="Traditional Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraditionalPage.aspx.cs" Inherits="Assignment1.TraditionalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPhead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">

    <h2 class="text-center">BEST THINGS TO DO IN QUARANTINE TIME</h2>
    <div class="form-group">
        <div class="col-4">
            <asp:TextBox runat="server" ID="TBSearch" CssClass="form-control" placeholder="Search Activity ..."></asp:TextBox>
        </div>
        <div class="col-2">
            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
    </div>
    <div class="row">
        <asp:Repeater ID="RThingToDoList" runat="server" DataSourceID="SDSThingToDoList">
            <ItemTemplate>
                <div class="col-md-4 itemContainer">
                    <div class="col-md-10 col-md-offset-1 item">
                        <h4 class="text-center"><%# Eval("id") %></h4>
                        <p class="text-center">
                            <em>
                                <%# Convert.ToString(Eval("thingToDo")).Length > 70 
                  ? Convert.ToString(Eval("thingToDo")).Substring(0, 70) + "..." 
                  : Eval("thingToDo") %>
                                <span>on <%# Eval("Date") %></span>
                            </em>
                        </p>
                        <a href="DetailPage.aspx?id=<%# Eval("id") %>" target="_blank">
                            <img class="img-thumbnail" runat="server" src='<%# Eval("image")%>' alt='<%# Eval("thingToDo") + " image" %>' style="width: 100%" />
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="SDSThingToDoList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Date.Date, ThingsToDo.id, ThingsToDo.thingToDo, ThingsToDo.dateID, ThingsToDo.image 
        FROM Date INNER JOIN ThingsToDo ON Date.Id = ThingsToDo.dateID">
    
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CPScript" runat="server">
</asp:Content>
