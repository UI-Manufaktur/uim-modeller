module uim.modeller.scripts.blogs.list;

@safe:
import uim.modeller;
import uim.modeller.scripts.blogs;

auto listEntities() {  
  return 

  jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
  jsLet([
    "unsortButtons":"[nameSort, displaySort]",
    "sortButtons":"[nameUp, nameDown, displayUp, displayDown]",
  ])~

  jsFetchEntities()~
  jsListEntities()~
  jsRenderEntities()~
  jsDoSelectEntities()~

  jsEvent("viewEntities", "'input'", "doPageEntities")~
  jsEvent("prevEntities", "'click'", "goPrevEntities")~
  jsEvent("nextEntities", "'click'", "goNextEntities")~
  jsEvent("btnClearSearch", "'click'", "clearSearch")~
  jsEvent("headDisplay", "'click'", "sortDisplay")~
  jsEvent("headName", "'click'", "sortName")~
  jsEvent("cbSelectAllEntities", "'click'", "doSelectEntities");

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/list.js", "w"); // open for writing
  f.write(listEntities);
}
