module uim.modeller.views.apis.create;

@safe:
import uim.modeller;
import uim.modeller.views.apis;

class DMDLApisCreateView : DAPPEntityCreateView {
  mixin(APPViewThis!("MDLApisCreateView"));

  override void initialize() {
    super.initialize;
    
    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      .link(["href":"/"], "UIM")
      .link(["href":"/modeller"], "Modeller")
      .link(["href":myRootPath], "Attribute")
    );

    this.header
      .breadcrumbs(bc)
      .rootPath(myRootPath)
      .title(titleCreate("Attribut erstellen"));

    this.form
      .action("/modeller/apis/actions/create")
      .rootPath(myRootPath);
    
    this.form.header
      .rootPath(myRootPath)
      .mainTitle("Neues Attribute")
      .subTitle("Bitte Werte eingeben")
      .actions([["cancel", "save"]]);

    this
      .form
        .body_(
            MDLAttributeFormBody(this.form)); 
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLApisCreateView~"::DMDLApisCreateView:beforeH5");
    super.beforeH5(options);

    debug writeln("this.entity -> ", this.entity ? this.entity.id.toString : " 'null' " );
    options["rootPath"] = myRootPath;

/*       .headerTitle(headerTitle)
      .bodyTitle(bodyTitle)
 */  
  }
}
mixin(APPViewCalls!("MDLApisCreateView"));