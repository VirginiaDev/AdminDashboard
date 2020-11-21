<!DOCTYPE html>
<%@page import="beans.TalkToSales"%>
<%@page import="beans.edit_homepage_images"%>
<%@page import="beans.careers"%>
<%@page import="beans.consultations"%>
<%@page import="beans.call_back"%>
<%@page import="beans.free_audit"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ApiController"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | DataTables</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Talk To Sales</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <!-- /.card -->

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
              <div class="row"><div class="col-sm-12 col-md-6"><div class="dt-buttons btn-group flex-wrap">  
               <button class="btn btn-secondary buttons-copy buttons-html5" tabindex="0" aria-controls="example1" type="button"><span>Copy</span></button>
               <button class="btn btn-secondary buttons-csv buttons-html5" tabindex="0" aria-controls="example1" type="button"><span>CSV</span></button> 
               <button class="btn btn-secondary buttons-excel buttons-html5" tabindex="0" aria-controls="example1" type="button"><span>Excel</span></button> 
               <button class="btn btn-secondary buttons-pdf buttons-html5" tabindex="0" aria-controls="example1" type="button"><span>PDF</span></button> 
               <button class="btn btn-secondary buttons-print" tabindex="0" aria-controls="example1" type="button"><span>Print</span></button> 
               <div class="btn-group"><button class="btn btn-secondary buttons-collection dropdown-toggle buttons-colvis" tabindex="0" aria-controls="example1" type="button" aria-haspopup="true" aria-expanded="false"><span>Column visibility</span></button></div> 
               </div>
               </div>
               <div class="col-sm-12 col-md-6">
               <div id="example1_filter" class="dataTables_filter">
               <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example1"></label>
               </div>
               </div>
               </div>
               <div class="row">
               <div class="col-sm-12">
                <table id="example1"  class="table table-bordered table-striped">
                  <thead>
                  <tr>
                 	 <th>Sr. No.</th>
                <th>Name</th>
     		 	<th>Email</th>
     		 	<th>Phone</th>
     		 	<th>Country</th>
     		 	<th>Submission</th>
     		 	<th>Trashed Status</th>
                  </tr>
                  </thead>
                  <%
String search="";
if(request.getParameter("search")!=null && !request.getParameter("search").isEmpty()){
	search=request.getParameter("search");
	System.out.println("search111=>>"+search);
	search =  search.replaceAll("'", "''");
	System.out.println("search222=>>"+search);

}else {
	search="0";
	System.out.println("search333=>>"+search);
}

%>
                  <%
String spageid = request.getParameter("page");
String totalpagecount = request.getParameter("totalpagecount");
if(spageid!=null){}else{
spageid="1";
}
if(totalpagecount!=null){}else{
totalpagecount="10";
}
%>
                <%
                  int pageid = Integer.parseInt(spageid);
                  int checkpage = Integer.parseInt(spageid);
                  int pageid1 = Integer.parseInt(spageid);
                  int total = Integer.parseInt(totalpagecount);
                  if (pageid == 1) {
                  } else {
                  pageid = pageid - 1;
                  pageid = pageid * total + 1;
                  }
                  int count=1+((checkpage-1)*total);
                  int spotLeftCount=0;
           %>
                  <tbody id="all">
                   <%
                   ApiController apiController=new ApiController();
                   ArrayList<TalkToSales> eh=apiController.fetchTalkToSales();
                 
                for(int i=0;i<eh.size();i++){
                 %>
                  <tr>
                    
      <td><%=count++%></td>
      <td><%=eh.get(i).getName()%></td>
      <td><%=eh.get(i).getEmail()%></td>
      <td><%=eh.get(i).getPhone()%></td>
      <td><%=eh.get(i).getCountry()%></td>
      <td><%=eh.get(i).getSubmission()%></td>
      <td><%=eh.get(i).getTrashed_status()%></td>
                  </tr>
                  <%} %>

					</tbody>
            
                  
                </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing 1 to 1 of 1 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="example1_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="example1_previous"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item next disabled" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->

<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>
