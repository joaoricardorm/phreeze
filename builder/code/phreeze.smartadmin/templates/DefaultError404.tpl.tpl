<?php
	$this->assign('title','Página não encontrada - Erro 404!');
	$this->assign('nav','home');

	$this->display('_Header.tpl.php');
?>

<div class="container">

	<!-- this is used by app.js for scraping -->
	<!-- ERROR The page you requested was not found /ERROR -->

	<!-- MAIN PANEL -->
	<div id="main" role="main">

		<!-- MAIN CONTENT -->
		<div id="content">

			<!-- row -->
			<div class="row">

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

					<div class="row">
						<div class="col-sm-12">
							<div class="text-center error-box">
								<h1 class="error-text tada animated"><i class="fa fa-times-circle text-danger error-icon-shadow"></i> Error 404</h1>
								<h1 class="font-xl"><strong><i class="fa fa-fw fa-warning fa-lg text-warning"></i> Página <u>não</u> encontrada</strong></h1>
								<br />
								<p class="lead">
									A página solicitada não foi encontrada no servidor.<br>
									Verifique se você inseriu o link correto na barra de endereços do navegador<br>

									<p class="btn-group">
										<a href="./" class="btn btn-default btn-lg"><i class="icon-margin-right fa fa-angle-left"></i> Voltar à página anterior</a>
										<a href="./" class="btn btn-default btn-lg"><i class="icon-margin-right fa fa-home"></i> Ir à página incial</a></p>
								</p>
							</div>

						</div>

					</div>

				</div>

				<!-- end row -->

			</div>

		</div>
		<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->


</div> <!-- /container -->

<?php
	$this->display('_Footer.tpl.php');
?>