module uim.modeller.views.components.forms.bodies.model;

@safe:
import uim.modeller;

class DMDLModelFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("MDLModelFormBody", true));

  override void initialize() {
    super.initialize;

    this
      .addFields([])
      .formGroupHandler(MDLFormGroupHandler); 
  }
}
mixin(APPFormComponentCalls!("MDLModelFormBody", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLModelFormBody);
}}