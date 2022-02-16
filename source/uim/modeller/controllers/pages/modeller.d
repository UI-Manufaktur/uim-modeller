module uim.modeller.controllers.pages.modeller;

@safe:
import uim.modeller;

class DMDLModellerPageController : DMDLPageController {
  mixin(APPPageControllerThis!("MDLModellerPageController"));

  override void initialize() {
    super.initialize;
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DMDLModellerPageController~":DMDLModellerPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DMDLModellerPageController~":DMDLModellerPageController::afterResponse");
    super.afterResponse(options);
  }
}
mixin(APPPageControllerCalls!("MDLModellerPageController"));

version(test_uim_mdl) {
  unittest {
    assert(new DMDLMdlPageController);
    assert(MDLMdlPageController);
  }
} 