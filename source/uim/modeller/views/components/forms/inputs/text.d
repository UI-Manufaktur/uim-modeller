module uim.modeller.views.components.forms.inputs.text;

@safe:
import uim.modeller;

class DMDLTextFormGroup : DAPPTextAreaFormGroup {
  mixin(FormComponentThis!("MDLTextFormGroup", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_text")
    .name("entity_text")
    .inputName("entity_text")
    .fieldName("text")
    .label("Inhalt");
  }
}
mixin(FormComponentCalls!("MDLTextFormGroup", true));

version(test_uim_modeller) {
  unittest {
    // TODO Tests
}}