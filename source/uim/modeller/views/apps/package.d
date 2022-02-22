module uim.modeller.views.apps;

@safe:
import uim.modeller;

// Main
public import uim.modeller.views.apps.index;

// CRUD Modules
public import uim.modeller.views.apps.create;
public import uim.modeller.views.apps.read;
public import uim.modeller.views.apps.update;
public import uim.modeller.views.apps.delete_;

package:
  string myRootPath = "/modeller/apps";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Apps", "Apps");