<div class="page-sidebar navbar-collapse collapse">
	<ul class="page-sidebar-menu">
		<li>
			<div class="sidebar-toggler hidden-phone"></div>
		</li>
			
		<#if CSC_MENU_LIST?exists>
			<li class="start <#if fullPath==(cscDomain+'/index.htm') || fullPath==cscDomain+'/'>active</#if>">
			   <a href="${cscDomain}/index.htm">
				   <i class="icon-home"></i> 
				   <span class="title">首页</span>
				   <#if fullPath==(cscDomain+'/index.htm') || fullPath==cscDomain+'/'><span class="selected"></span></#if>
			   </a>
			</li>
			<#list CSC_MENU_LIST as cscMenu>
				<li <#if fullPath==cscMenu.menuVo.url>class="active"</#if>>
					<a href="javascript:;"> 
						<i class="icon-leaf"></i>
						<span class="title">${cscMenu.menuVo.name}</span>
						<span class="selected"></span> 
						<span class="arrow"></span> 
					</a>
					<#if cscMenu.hasChild>
						<ul class="sub-menu">
							<#list cscMenu.childList as child1>
							<li <#if fullPath==child1.menuVo.url>class="active"</#if>  >
								<a href="${child1.menuVo.url}">${child1.menuVo.name}
									<#if child1.hasChild><span class="arrow "></span></#if>
								</a>
								<#if child1.hasChild>
									<ul class="sub-menu">
										<#list child1.childList as child2>
											<li <#if fullPath==child2.menuVo.url>class="active"</#if>>
												<a href="${child2.menuVo.url}">${child2.menuVo.name}</a>
											</li>
										</#list>
									</ul>
								</#if>
							</li>
							</#list>
						</ul>
					</#if>
					
				</li>
			</#list>
		</#if>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		//选中当前菜单		
		$(".sub-menu .active").parent().parent().addClass("active").parent().parent().addClass("active");
		$('.sub-menu .active').find('span.arrow').addClass('open');
	});
</script>
