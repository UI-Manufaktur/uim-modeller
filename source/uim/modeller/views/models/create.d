module uim.modeller.views.models.create;

@safe:
import uim.modeller;
import uim.modeller.views.models;

class DMDLModelsCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLModelsCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Models")
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
      MDLEntityClassFormBody(this.form)
      .fields(["private", "name", "display", "description", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModelsCreateView~"::DMDLModelsCreateView:beforeH5");
    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    super.beforeH5(options);

    options["rootPath"] = myRootPath;

/*     auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";
 */

    this.form
      .action("/modeller/models/actions/create")
/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */      .entity(this.entity);
  }
}
mixin(APPViewCalls!("MDLModelsCreateView"));