module uim.modeller.views.components.forms.bodies.app;

@safe:
import uim.modeller;

class DMDLAppFormContent : DAPPEntityFormContent {
  mixin(FormComponentThis!("MDLAppFormContent", true));

  override void initialize() {
    super.initialize;
    
    this
      .addFields(["isnullable", "isreadonly", "dataformat", "valueconstrainedtolist"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLAppFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLAppFormContent);
}}