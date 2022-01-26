module uim.modeller.views.entityclasses.create;

@safe:
import uim.modeller;
import uim.modeller.views.entityclasses;

class DMDLEntityClassesCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLEntityClassesCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/modeller"], "MDL")
      .link(["href":myRootPath], "Entityclasses")
    );

    this.pageHeader
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Blog erstellen"));

    this.form
      .action(myRootPath~"/actions/create")
      .rootPath(myRootPath);
    
    this.form.formHeader
      .rootPath(myRootPath)
      .mainTitle("Neuer Blog")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this.form.formBody(
      MDLPostFormBody(this.form)
      .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesCreateView~"::DMDLEntityClassesCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    if (this.controller && this.controller.database) {
      this.entity(this.controller.database["uim"]["entityclasses"].createEntity);
    }

    this.form
      .action("/cms/entityclasses/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLEntityClassesCreateView"));
