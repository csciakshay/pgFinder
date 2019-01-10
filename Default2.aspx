<%@ Page Title="" Language="VB" MasterPageFile="~/MainMaster.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="stylesheet" type="text/css" href="Template/assets/datetime/jquery.datetimepicker.css"/>
<script src="Template/assets/datetime/jquery.js"></script>
<script src="Template/assets/datetime/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript">
        $(function () {
            jQuery('#name').datetimepicker({
                format:'d/m/Y H:i',
                minDate: new Date()
            }); 
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- Heading -->
			<div id="heading" >
				<h1>User Entry Form</h1>
			</div>
            
            <section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                    <h3>User Details</h3>
									<form method="post" action="#">
										<div class="row gtr-uniform">
											<div class="col-6 col-12-xsmall">
												<input type="text" name="name" id="name" value="" placeholder="Name" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="email" name="email" id="email" value="" placeholder="Email" />
											</div>
											<!-- Break -->
											<div class="col-12">
												<select name="category" id="category">
													<option value="">- Select -</option>
													<option value="alpha">Option alpha</option>
													<option value="beta">Option beta</option>
													<option value="gamma">Option gamma</option>
													<option value="delta">Option delta</option>
													<option value="epsilon">Option epsilon</option>
													<option value="zeta">Option zeta</option>
													<option value="eta">Option eta</option>
													<option value="theta">Option theta</option>
												</select>
											</div>
											<!-- Break -->
											<div class="col-4 col-12-small">
												<input type="radio" id="radio-alpha" name="radio" checked>
												<label for="radio-alpha">Radio alpha</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="radio-beta" name="radio">
												<label for="radio-beta">Radio beta</label>
											</div>
											<div class="col-4 col-12-small">
												<input type="radio" id="radio-gamma" name="radio">
												<label for="radio-gamma">Radio gamma</label>
											</div>
											<!-- Break -->
											<div class="col-6 col-12-small">
												<input type="checkbox" id="checkbox-alpha" name="checkbox">
												<label for="checkbox-alpha">Checkbox alpha</label>
											</div>
											<div class="col-6 col-12-small">
												<input type="checkbox" id="checkbox-beta" name="checkbox" checked>
												<label for="checkbox-beta">Checkbox beta</label>
											</div>
											<!-- Break -->
											<div class="col-12">
												<textarea name="textarea" id="textarea" placeholder="Alpha beta gamma delta" rows="6"></textarea>
											</div>
											<!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="Submit Form" class="primary" /></li>
													<li><input type="reset" value="Reset" /></li>
												</ul>
											</div>
										</div>
									</form>
                                    </div>
                                    </div>
                                    </section>
</asp:Content>

