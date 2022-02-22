module uim.modeller.views.interfaces.read;

@safe:
import uim.modeller;
import uim.modeller.views.interfaces;

class DMDLInterfacesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLInterfacesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Interfaces")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(
        titleView("Blog anzeigen"));
    
    this.form
      .rootPath(myRootPath);

    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Interfaces")
      .subTitle("Interfaces anzeigen");

    this.form.body_(
      MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLInterfacesReadView~"::DMDLInterfacesReadView:beforeH5");
    super.beforeH5(options);

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity); */
  }
}
mixin(APPViewCalls!("MDLInterfacesReadView"));

version(test_uim_modeller) {
  unittest {
    // TODO
}}