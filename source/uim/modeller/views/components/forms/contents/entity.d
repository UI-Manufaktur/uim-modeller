module uim.modeller.views.components.forms.contents.entity;

@safe:
import uim.modeller;

class DMDLEntityFormContent : DEntityFormContent {
  mixin(FormComponentThis!("MDLEntityFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .addFields(["models", "packages", "modules", "mainTitle", "subTitle", "summary", "text"])
      .formGroupHandler(MDLFormGroupHandler(this.form)); 
  }
}
mixin(FormComponentCalls!("MDLEntityFormContent", true));

version(test_uim_modeller) {
  unittest {
    assert(MDLEntityFormContent);
}}