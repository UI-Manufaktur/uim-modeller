module uim.modeller.scripts.demos.create;

@safe:
import uim.modeller;
import uim.modeller.scripts.demos;

auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entity_theme"])~
    "setThemes();"~
    jsCreateEntity();

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
