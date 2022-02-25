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
    
    this.form();
    
    this.form
      .parameter("rootPath", myRootPath);

    if (this.form) {
      debug writeln("Found form: (%s)".format(form.name));
      if (this.form.header) {
        debug writeln("Found this.form.header: (%s)".format(this.form.header.name));

        this.form.header
          .parameter("rootPath", myRootPath)
          .parameter("mainTitle", "Entitätsklassen")
          .parameter("subTitle", "Entitätsklasse anzeigen");
      }

      if (this.form.body_) {
        debug writeln("Found this.form.body_: (%s)".format(this.form.body_.name));

        this.form.body_(
          MDLEntityClassFormBody(this.form).crudMode(CRUDModes.Read)
            .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"])); 
      }
    }
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