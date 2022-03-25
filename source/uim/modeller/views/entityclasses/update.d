module uim.modeller.views.entityclasses.update;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesUpdateView : DAPPEntityUpdateView {
  mixin(APPViewThis!("MDLEntityClassesUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .rootPath("/modeller/entityclasses");
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":"/modeller/entityclasses"], "Entitätenklassen")
      .link(["active"], ["href":"/modeller/entityclasses/update"], "Bearbeiten")
    );

    this.header
      .breadcrumbs(bc)
      .parameter("rootPath", this.rootPath)
      .title(titleEdit("Entitätenklasse bearbeiten"));
      
    this.form
      .action("/modeller/entityclasses/actions/save")
      .crudMode(CRUDModes.Update)
      .parameter("rootPath", this.rootPath);

    this.form.header
      .parameter("rootPath", this.rootPath)
      .parameter("mainTitle", "Entitätsklassen")
      .parameter("subTitle", "Entitätsklasse bearbeiten");
      
    this.form.body_(
      MDLEntityClassFormContent(this.form)
        .fields(["name", "display", "description", "className", "models", "keywords", "imagePath", "summary", "text"])); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdateView~"::DMDLEntityClassesUpdateView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Entitätenklasse ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Entitätenklasse Name:";

    this.form
      .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesUpdateView"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DMDLEntityClassesUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(MDLEntityClassesUpdateView); 
}}