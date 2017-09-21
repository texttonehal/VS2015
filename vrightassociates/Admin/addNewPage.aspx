<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageVRightAssociates.Master" AutoEventWireup="true" CodeBehind="addNewPage.aspx.cs" Inherits="vrightassociates.Admin.addNewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-offset-2 col-md-10">
                <h1><i class="fa fa-snowflake-o"></i> Add New Page</h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i> Page</a></li>
                    <li class="active"><i class="fa fa-th-list"></i> Add New Page</li>
                </ol>

                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-8">
                        <!-- Add New Post Fields Start -->
                        <div class="panel panel-default">
                            <div class="pad">
                                <div class="form-group">
                                    <small><b>Title*</b></small>
                                    <input type="text" name="txtTitle" class="form-control" placeholder="Title" required>
                                </div>
                                <div class="form-group">
                                    <small><b>Page Content</b></small>
                                    <!--Editor Start-->
                                    <!--<div class="summernote"></div> -->
                                    <textarea name="txtPageArea" class="summernote"></textarea>
                                    <!--Editor End-->
                                </div>
                            </div>
                        </div>
                        <!-- Add New Post Fields End -->

                        <!-- SEO Fields Start -->
                        <div class="panel panel-default">
                            <div class="panel-heading"><i class="fa fa-th-list"></i> SEO</div>
                            <div class="pad">
                                <div class="form-group">
                                    <small><b>Title</b></small>
                                    <input type="text" name="txtSeoTitle" class="form-control">
                                    <small>characters. Most search engines use a maximum of 60 chars for the title.</small>
                                </div>
                                <div class="form-group">
                                    <small><b>Description</b></small>
                                    <textarea name="txtAreaDesc" class="form-control" rows="4"></textarea>
                                    <small>characters. Most search engines use a maximum of 160 chars for the description.</small>
                                </div>                            
                            </div>
                        </div>
                        <!-- SEO Fields End -->
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <!--Publish Btn Start-->
                        <div class="panel panel-default">
                            <div class="panel-heading"><i class="fa fa-th-list"></i> Publish</div>
                            <div class="pad">
                                <asp:Button ID="btnPublish" runat="server"  Text="Publish" CssClass="btn btn-primary" OnClick="btnPublish_Click"/>
                                <asp:Button ID="btnDraft" runat="server" Text="Draft" CssClass="btn btn-primary" OnClick="btnDraft_Click"/>
                                <!--<button type="button" class="btn btn-primary"><i class="fa fa-rocket"></i> Publish</button>
                                <button type="button" class="btn btn-default"><i class="fa fa-save"></i> Draft</button> -->
                            </div>
                        </div>
                        <!--Publish Btn End-->

                        <!--Tags End-->
                        <div class="panel panel-default">
                            <div class="panel-heading"><i class="fa fa-th-list"></i> Tags</div>
                            <div class="pad">
                                <div id="tag">
                                    <input type="text" name="txtTags" id="tags" placeholder="...">
                                    <span onclick="addtags()"><i class="fa fa-plus"></i></span>
                                    <p id="error"></p>
                                </div>

                                <!--Tag item Display-->
                                <ul id="myUL">
                                </ul>
                            </div>
                        </div>
                        <!--Tags End-->

                        <!--Featured Image End-->
                        <div class="panel panel-default">
                            <div class="panel-heading"><i class="fa fa-th-list"></i> Featured Image</div>
                            <div class="pad featureimg">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file"/>
                                <!-- <input id="file-0a" name="txtFile" class="file" type="file" multiple data-min-file-count="1"> -->
                            </div>
                        </div>
                        <!--Featured Image End-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
