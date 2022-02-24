module uim.modeller.views.entityclasses.read;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesReadView : DAPPEntityReadView {
  mixin(APPViewThis!("MDLEntityClassesReadView"));

  override void initialize() {
    super.initialize;

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätsklassen")
      .link(["active"], ["href":"/modeller/entityclasses/read"], "Anzeigen")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", myRootPath)
      .parameter("title", titleView("Entitätsklasse anzeigen"));
    
    this.form
      .parameter("rootPath", myRootPath);

    this.form.header
      .parameter("rootPath", myRootPath)
      .parameter("mainTitle", "Entitätsklassen")
      .parameter("subTitle", "Entitätsklasse anzeigen");

    this.form.body_(
      MDLEntityClassFormBody.crudMode(CRUDModes.Read));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesReadView~"::DMDLEntityClassesReadView("~this.name~"):beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this.form
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesReadView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesReadView); 
}}