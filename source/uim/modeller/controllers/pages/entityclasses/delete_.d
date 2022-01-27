module uim.modeller.controllers.pages.entityclasses.delete_;

@safe:
import uim.modeller;

class DMDLEntityClassesDeletePageController : DAPPPageController {
  mixin(APPPageControllerThis!("MDLEntityClassesDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        MDLEntityClassesDeleteView(this))
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLEntityClassesUpdatePageController~":DMDLEntityClassesUpdatePageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
    if (entityId && entityId.isUUID && this.database) {  
      auto dbEntity = database["modeller", "entityclasses"].findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityView)this.view) {
        with(entityView) {
          entity(dbEntity);
          crudMode(CRUDModes.Delete);
          rootPath("/mdl/entityclasses");
          readonly(true);
        }
      }
    }
  }
}
mixin(APPPageControllerCalls!("MDLEntityClassesDeletePageController"));