<?php
	$this->assign('title','{$plural} - {$appname}');
	$this->assign('nav','{$plural|lower}');

	$this->display('_Header.tpl.php');
?>

<script type="text/javascript">
	$LAB.script("scripts/app/{$plural|lower}.js").wait(function(){
		$(document).ready(function(){
			page.init();
		});
		
		// hack for IE9 which may respond inconsistently with document.ready
		setTimeout(function(){
			if (!page.isInitialized) page.init();
		},1000);
	});
</script>


<!-- #MAIN PANEL -->
<div id="main" role="main">

	<!-- RIBBON -->
	<div id="ribbon">
		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="./"><i class="fa fa-home"></i> Início</a></li>
			<li><a href="./{$plural|lcfirst}"><i class="fa fa-group"></i> {$plural}</a></li>
		</ol>
		<!-- end breadcrumb -->
	</div>
	<!-- END RIBBON -->

	<!-- #MAIN CONTENT -->
	<div id="content">

				<!-- row -->
				<div class="row cad-and-search">
					<section class="col-xs-12 col-sm-6 margin-bottom-13px-on-xs">
						<div id="newButtonContainer" class="buttonContainer">
							<button id="new{$singular}Button" class="btn btn-primary"><i class="icon-margin-right fa fa-plus"></i> <strong>Cadastrar</strong> {$singular}</button>
							<button id="excluir{$singular}Button" class="btn btn-danger margin-left-10px" title="Excluir {$singular} selecionado" disabled><i class="icon-margin-right fa fa-trash"></i> <strong>Excluir</strong> <span class="visible-lg-inline-block">{$singular}</span></button>
						</div>
					</section>
					<section class="col-xs-12 col-sm-6 col-md-4 pull-right">
						<div class="input-group input-group-md">
							<div class="icon-addon addon-md">
								<input id="filter" type="text" placeholder="Buscar..." class="form-control input-small">
								<label for="busca" class="fa fa-search"></label>
							</div>
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button">Buscar</button>
								</span>
						</div>
					</section>
				</div>
				<!--end row div-->

		<!-- widget grid -->
		<section id="widget-grid" class="main">

				<!--CARREGANDO-->
				<div id="carregandoCollection" class="jarviswidget fill-body-height jarviswidget-color-blue" data-widget-sortable="false" data-widget-fullscreenbutton="false" data-widget-togglebutton="false" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-deletebutton="false">
					<header>
						<h2><b><i class="icon-margin-right fa fa-th-list"></i> {$plural}</b></h2>
					</header>

					<div class="widget-body custom-scroll">
						<h1 class="text-center text-muted"><i class="fa fa-spin fa-circle-o-notch fa-2x"></i> Carregando...</h1>
					</div>
				</div>

			<!-- underscore template for the collection -->
			<script type="text/template" id="{$singular|lcfirst}CollectionTemplate">


				<!-- widget grid -->
				<section id="widget-grid" class="main">


				<!-- Importante para o Widget -->
				<article>

					<!-- Widget ID (each widget will need unique ID)-->
					<div class="jarviswidget fill-body-height jarviswidget-color-blue jarviswidget-sortable" id="wid-id-0" data-widget-fullscreenbutton="false" data-widget-togglebutton="false" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-deletebutton="false">
						<!-- widget options:
							usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
							data-widget-colorbutton="false"
							data-widget-editbutton="false"
							data-widget-togglebutton="false"
							data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false"
							data-widget-collapsed="true"
							data-widget-sortable="false"
						-->

						<header>
							<h2><b><i class="icon-margin-right fa fa-th-list"></i> {$plural}</b></h2>

							<div id="loader" class="progress progress-sm progress-striped active">
								<div class="progress-bar bg-color-light" role="progressbar" style="width: 100%"></div>
							</div>

							<div class="jarviswidget-ctrls hidden-xs" role="menu">
								<a href="javascript:void(0);" class="button-icon fullscreen-grid-btn" rel="tooltip" title="" data-placement="bottom" data-original-title="Ampliar"><i class="fa fa-expand"></i></a>
							</div>
						</header>

						<!-- widget div-->
						<div>

							<!-- widget content -->
							<div class="widget-body custom-scroll">

								<% if(items.length === 0){ %>
									<h1 class="text-center text-muted"><i class="fa fa-exclamation-triangle"></i> Nenhum {$singular} encontrado</h1>
								<% } else { %>

									<div id="no-more-tables">

										<table class="collection table table-bordered table-condensed table-hover responsible-table">
											<thead>
												<tr>
									{foreach from=$table->Columns item=column name=columnsForEach}
									{if $smarty.foreach.columnsForEach.index == 5}<!-- UNCOMMENT TO SHOW ADDITIONAL COLUMNS
									{/if}
													<th id="header_{$column->NameWithoutPrefix|studlycaps}">{$column->NameWithoutPrefix|underscore2space}<% if (page.orderBy == '{$column->NameWithoutPrefix|studlycaps}') { %> <i class='fa fa-arrow-<%= page.orderDesc ? 'up' : 'down' %>' /><% } %></th>
									{/foreach}
									{if $smarty.foreach.columnsForEach.index >= 5}-->
									{/if}
													<th id="header_Edit"></th>
												</tr>
											</thead>
											<tbody>
											<% items.each(function(item) {ldelim} %>
												<tr id="<%= _.escape(item.get('{$table->GetPrimaryKeyName()|studlycaps|lcfirst}')) %>">
									{foreach from=$table->Columns item=column name=columnsForEach}
									{if $smarty.foreach.columnsForEach.index == 5}<!-- UNCOMMENT TO SHOW ADDITIONAL COLUMNS
									{/if}
									{if $column->Type == "date"}
													<td><%if (item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}')) { %><%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('MMM D, YYYY') %><% } else { %>NULL<% } %></td>
									{elseif $column->Type == "datetime" ||  $column->Type == "timestamp"}
													<td><%if (item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}')) { %><%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('MMM D, YYYY h:mm A') %><% } else { %>NULL<% } %></td>
									{elseif $column->Type == "time"}
													<td><%if (item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}')) { %><%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('h:mm A') %><% } else { %>NULL<% } %></td>
									{else}
													<td><%= _.escape(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}') || '') %></td>
									{/if}
									{/foreach}
									{if $smarty.foreach.columnsForEach.index >= 5}-->
									{/if}
													<td class="edit" style="width:65px;"><a><i class="fa fa-edit"></i> Editar</a></td>
												</tr>
											<% {rdelim}); %>
											</tbody>
										</table>

									</div><!--no-more-tables-->

									<%= view.getItensPorPagina(items.pageSize, items.totalResults) %>
									
									<div class="text-center">
										<%=  view.getPaginationHtml(page) %>
									</div>

								<% } %><!--items length > 0-->

							</div>
							<!-- end widget content -->

						</div><!-- end widget div -->
					</div><!-- end widget -->
				</article><!-- end article - importante para o Widget -->
				</section><!-- end widget grid -->
			</script>


		<!-- underscore template for the model -->
			<script type="text/template" id="{$singular|lcfirst}ModelTemplate">
				<form class="form-horizontal smart-form" onsubmit="return false;">
					<fieldset>
						<div class="row">
			{foreach from=$table->Columns item=column name=columnsForEach}
							<section class="col col-sm-12">
								<div id="{$column->NameWithoutPrefix|studlycaps|lcfirst}InputContainer" class="control-group">
									<label class="control-label" for="{$column->NameWithoutPrefix|studlycaps|lcfirst}">{$column->NameWithoutPrefix|underscore2space}</label>
									<div class="controls inline-inputs">
										{if ($column->Key == "MUL" && $column->Constraints) or $column->IsEnum()}
											<label class="select">
										{else}
											<label class="input">
										{/if}
									
						{if $column->Extra == 'auto_increment'}
												<i class="icon-prepend fa fa-hashtag"></i>
												<input disabled="disabled" class="input-xlarge uneditable-input" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" value="<%= _.escape(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}') || '') %>" />
						{elseif $column->Key == "MUL" && $column->Constraints}
												<select class="select" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" name="{$column->NameWithoutPrefix|studlycaps|lcfirst}"></select>
						{elseif $column->IsEnum()}
												<select class="select" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" name="{$column->NameWithoutPrefix|studlycaps|lcfirst}">
													<option value=""></option>
						{foreach from=$column->GetEnumValues() item=enumVal name=enumValForEach}
													<option value="{$enumVal|escape}"<% if (item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}')=='{$enumVal|escape}') { %> selected="selected"<% } %>>{$enumVal|escape}</option>
						{/foreach}
												</select>
						{elseif $column->Type == "date"}	
												<i class="icon-prepend fa fa-calendar"></i>
												<input style="padding-left: 37px;" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" type="date" value="<%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('YYYY-MM-DD') %>" />
						{elseif $column->Type == "datetime" || $column->Type == "timestamp"}
												<i class="icon-prepend fa fa-calendar"></i>
												<input id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" type="text" class="input-medium" value="<%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('DD/MM/YYYY') %> às <%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('HH:mm') %>" />
						{elseif $column->Type == 'time'}
												<i class="icon-prepend fa fa-clock-o"></i>
												<div class="input-append bootstrap-timepicker-component">
													<input id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" type="text" class="timepicker-default input-small" value="<%= _date(app.parseDate(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}'))).format('HH:mm') %>" />
													<span class="add-on"><i class="fa fa-time"></i></span>
												</div>
						{elseif $column->Type == 'text' || $column->Type == 'tinytext' || $column->Type == 'mediumtext' || $column->Type == 'longtext'}
												<i class="icon-prepend fa fa-align-left"></i>
												<textarea class="input-xlarge" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" rows="3"><%= _.escape(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}') || '') %></textarea>
						{elseif false}
												<select id="{$column->NameWithoutPrefix|studlycaps|lcfirst}"><option>something</option><option>2</option></select>
						{else}
												<i class="icon-prepend fa fa-th-list"></i>	
												<input type="text" class="input-xlarge" id="{$column->NameWithoutPrefix|studlycaps|lcfirst}" placeholder="{$column->NameWithoutPrefix|underscore2space}" value="<%= _.escape(item.get('{$column->NameWithoutPrefix|studlycaps|lcfirst}') || '') %>">
						{/if}

											{if ($column->Key == "MUL" && $column->Constraints) or $column->IsEnum()}
												<i></i>
											{/if}

										</label>
										<span class="help-inline"></span>
									</div><!--controls-->
								</div><!--input container-->

							</section>
			{/foreach}				
						</div> <!--row-->
					</fieldset>
				</form>

				<!-- delete button is is a separate form to prevent enter key from triggering a delete -->
				<div class="row">
					<form id="delete{$singular}ButtonContainer" class="form-horizontal col-xs-12" onsubmit="return false;">
						<fieldset>
							<div class="control-group">
								<div class="controls">
									<hr>
									<button id="delete{$singular}Button" class="btn btn-mini btn-danger"><i class="fa fa-remove icon-white"></i> Excluir {$singular}</button>
							<span id="confirmDelete{$singular}Container" class="hide animated">
								<button id="cancelDelete{$singular}Button" class="btn btn-mini">Cancelar</button>
								<button id="confirmDelete{$singular}Button" class="btn btn-mini btn-danger">Confirmar</button>
							</span>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</script>

			<!-- modal edit dialog -->
			<div id="{$singular|lcfirst}DetailDialog" class="modal fade modal-on-top" data-backdrop="static"  tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<a class="close" data-dismiss="modal">&times;</a>
							<h4>
								<i id="icone-acao-modal" class="fa fa-edit"></i> <span id="titulo-modal">Editar</span> {$singular}
								<div id="modelLoader" class="progress progress-sm progress-striped active">
									<div class="progress-bar bg-color-light" role="progressbar" style="width: 100%"></div>
								</div>
							</h4>
						</div>
						<div class="modal-body">
							<div id="modelAlert"></div>
							<div id="{$singular|lcfirst}ModelContainer"></div>
						</div>
						<div class="modal-footer">
							<button id="save{$singular}Button" class="btn btn-primary">Salvar</button>
							<button class="btn btn-default" data-dismiss="modal">Cancelar</button>
						</div>
					</div><!-- /.modal-content -->
					
					<div class="block-ui-modal animated" style="display: none;"></div>
					
				</div><!-- /.modal-dialog -->
			</div>

			<div id="collectionAlert"></div>

			<div id="{$singular|lcfirst}CollectionContainer" class="collectionContainer">
			</div>

	</div>
	<!-- END #MAIN CONTENT -->

</div>
<!-- END #MAIN PANEL -->

<?php
	$this->display('_Footer.tpl.php');
?>	