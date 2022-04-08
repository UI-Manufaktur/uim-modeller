module uim.modeller.controllers.pages.components.index;

@safe:
import uim.modeller;

class DMDLComponentsIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("MDLComponentsIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/modeller/components")
      .collectionName("modeller_components");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/modeller"], "Modeller")
        .item(["active", "fw-bold"], "components")
      );

      pgHeader
        .rootPath("/modeller/components")
        .breadcrumbs(bc)
        .title(titleView("Übersicht KLassen"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/modeller/components")
       .content(EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Klassen")
            .subTitle("KLassen anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("MDLComponentsIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DMDLComponentsIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(MDLComponentsIndexPageController); 
}}