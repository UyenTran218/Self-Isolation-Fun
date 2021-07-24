<%@ Page Title="Activity Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailPage.aspx.cs" Inherits="Assignment1.DetailPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
    <link href="Content/jquery.fancybox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPBody" runat="server">
    <div class="row justify-content-center">
        <div class="col-8">
            <h2 class="text-center">Selected Activity</h2>
            <fieldset>
                <asp:FormView runat="server" ID ="FVItem" RenderOuterTable="false"
                    ItemType="Assignment1.Models.ThingsToDo" DataKeyNames="id"
                    SelectMethod="FVItem_GetItem"
                    InsertMethod="FVItem_InsertItem"
                    UpdateMethod="FVItem_UpdateItem"
                    DeleteMethod="FVItem_DeleteItem">
                    <ItemTemplate>
                        
                        <div class="form-group">
                            <label>Activity no.<%# Item.id.ToString() %>:</label>
                            <%# Item.thingToDo %>
                        </div>
                      
                        <div class="form-group">
                            <label>Description:</label>
                            <%# Item.description %>
                        </div>

                        <div class="form-group">
                            
                            <img src="<%# Item.mainImage %>" alt="<%# Item.thingToDo %>" />
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Delete" />
                            <asp:Button runat="server" CommandName="Edit" CssClass="btn btn-primary" Text="Edit" />
                            <a href="TraditionalPage.aspx" class="btn btn-secondary">Back To List Of Activities</a>
                        </div>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <legend>Item #:[auto]</legend>
                        <div class="form-group">
                            <label>Item:</label>
                            <asp:TextBox runat="server" ID="TBTitle" CssClass="form-control" Text="<%# BindItem.thingToDo %>" />
                        </div>
                        
                        <div class="form-group">
                            <label>Description:</label>
                            <asp:TextBox runat="server" ID="TBDescription" Text="<%# BindItem.description %>"
                                TextMode="multiline" Rows="10" CssClass="form-control" />
                        </div>

                        <div class="form-group">
                            <label>Image:</label>
                            <asp:TextBox runat="server" ID="TBImage" Text="<%# BindItem.mainImage %>" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" CommandName="Cancel" CssClass="btn btn-warning" Text="Cancel" />
                            <asp:Button runat="server" CommandName="Insert" CssClass="btn btn-success" Text="Save" />
                            <a href="TraditionalPage.aspx" class="btn btn-secondary">Back To List Of Activities</a>
                        </div>

                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <legend>No.<%# Item.id.ToString()%></legend>
                        <div class="form-group">
                            <label>Activity Name:</label>
                            <asp:TextBox runat="server" ID="TBTitle" CssClass="form-control" Text="<%# BindItem.thingToDo %>" />
                        </div>
                  
                        <div class="form-group">
                            <label>Description:</label>
                            <asp:TextBox runat="server" ID="TBDescription" Text="<%# BindItem.description %>"
                                TextMode="multiline" Rows="10" CssClass="form-control" />
                        </div>

                        <div class="form-group">
                            <label>Image:</label>
                            <asp:TextBox runat="server" ID="TBImage" Text="<%# BindItem.mainImage %>" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" CommandName="Cancel" CssClass="btn btn-warning" Text="Cancel" />
                            <asp:Button runat="server" CommandName="Update" CssClass="btn btn-success" Text="Save" />
                        </div>

                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <p>
                            Currently there is no item selected. Would you like to 
                            <asp:LinkButton runat="server" CommandName="New" Text="create a new activity" /> ?
                        </p>
                        <a href="TraditionalPage.aspx" class="btn btn-secondary">Return To List Of Activities
                        </a>
                    </EmptyDataTemplate>
                </asp:FormView>
            </fieldset>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPScript" runat="server">
    <script src="Scripts/jquery.fancybox.js"></script>
</asp:Content>
