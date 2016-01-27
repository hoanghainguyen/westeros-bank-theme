<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

	<head>
		<title>${the_title} - ${company_name}</title>

		<meta content="initial-scale=1.0, width=device-width" name="viewport" />

		${theme.include(top_head_include)}

	</head>

	<body class="${css_class}">

		<@liferay_ui["quick-access"] contentId="#main-content" />

		<@liferay.product_menu_sidebar state="${liferay_product_menu_state}" />

		<#if is_setup_complete && is_signed_in>
			<@liferay_control_menu["control-menu"] />
		</#if>

		<div id="wrapper">
			<div class="navbar-recursive">
				<nav class="navbar navbar-inverse">
					<div class="navbar-wrapper">
						<div class="container-fluid-1280" id="headerTopBar">
							<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone")>
							<div class="hidden-xs nav navbar-nav">
								<@liferay.navigation_menu default_preferences="${freeMarkerPortletPreferences}" />
							</div>
							<div class="nav navbar-nav navbar-right">
								<@liferay.user_personal_bar />
							</div>

							<#if !is_signed_in>
								<div class="hidden-xs nav navbar-nav navbar-right">
									<@liferay.navigation_menu default_preferences="${freeMarkerPortletPreferences}" />
								</div>
							</#if>
							<#assign VOID = freeMarkerPortletPreferences.reset()>
						</div>
					</div>
				</nav>
			</div>

			<header class="container-fluid-1280" id="banner" role="banner">
				<div class="navbar-header" id="heading">
					<button aria-controls="navigation" aria-expanded="false" class="collapsed navbar-toggle" data-target="#navigationCollapse>" data-toggle="collapse" type="button">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<a class="$logo_css_class" href="$site_default_url" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						<img alt="$logo_description" height="56" src="${images_folder}/westeros-bank-logo.png" />
					</a>

				</div>

				<#if has_navigation && is_setup_complete>
					<#include "${full_templates_path}/navigation.ftl" />
				</#if>

			</header>

			<main id="content" role="main">

				<h1 class="hide-accessible">${the_title}</h1>

				<#if selectable>
					${theme.include(content_include)}
				<#else>
					${portletDisplay.recycle()}

					${portletDisplay.setTitle(the_title)}

					<@liferay_theme["wrap-portlet"] page="portlet.ftl">
						${theme.include(content_include)}
					</@>
				</#if>
				<#include "${full_templates_path}/TEMP-content.ftl" />
			</main>

			<#include "${full_templates_path}/footer.ftl" />

		</div>

		${theme.include(body_bottom_include)}

		${theme.include(bottom_include)}

	</body>

</html>