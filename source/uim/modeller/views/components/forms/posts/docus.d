module uim.modeller.views.components.forms.posts.docus;

@safe:
import uim.modeller;
// import models.modeller.entities.docu;

class DMDLDocuForm : DMDLPostForm {
  mixin(APPFormThis!("MDLDocuForm", true));

  override void initialize() {
    super.initialize;

    this
    .formBody(MDLDocuFormBody);
  }
}
mixin(APPFormCalls!("MDLDocuForm", true));

version(test_uim_modeller) {
  unittest {
    // TODO
}}
