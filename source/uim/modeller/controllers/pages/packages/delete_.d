module uim.modeller.controllers.pages.packages.delete_;

@safe:
import uim.modeller;

class DMDLPackagesDeletePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLPackagesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLPackagesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLPackagesDeletePageController~":DMDLPackagesDeletePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["uim", "modeller_packages"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/modeller/packages");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLPackagesDeletePageController"));