<?php

class body {
    public function body(){
    }
    public function createbody() {
        global $db;
        global $doc;
        global $params;
        $category = $params['category'];
        $doc .= '<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">MasterShop24</h1>

          <div class="row placeholders">

              <h4>Hauptkategorie / Unterkategorie oder Suchbegriff</h4>
              <span class="text-muted">Hauptkategorie / Unterkategorie</span>

          </div>

          <div class="table-responsive">
            <table class="table table-striped table-borderd">
              <thead>
                <tr>
                    <th>Titel</th>
                    <th>Preis</th>
                    <th>Anzahl</th>
                    <th>Beschreibung</th>
                    <th>Bild</th>
                </tr>
              </thead>
              <tbody>';
              if ($category) {
                  $sqlQuery = "SELECT * FROM Artikel as a
                               INNER JOIN Untergruppe as u
                               ON a.fidUntergruppe = u.idUntergruppe
                               WHERE fidHauptgruppe = $category";
            } else {
                $sqlQuery = "SELECT * FROM Artikel";
            }

              $articlelist = $db->getQueryResults($sqlQuery);
              foreach ($articlelist as $article){
                  $articleID = $article['idArtikel'];
                  $price = $article['NettoPreis'];
                  $title = $article['ArtikelTitel'];
                  $description = $article['Beschreibung'];
                  $imagelink = $article['BildLink'];
                  $subgroupID = $article['fidUntergruppe'];
                  $subgroupQuery = "SELECT Titel FROM Untergruppe WHERE idUntergruppe=$subgroupID";
                  $subgroupQResult = $db->getQueryResults($subgroupQuery);
                  $subgroup = $subgroupQResult[0]['Titel'];
                  $doc .= '<tr class="singlePageLink">' . "\n";
                $doc .= '<tr class="singlePageLink">' . "\n";
                $doc .= "<td>$title" . ' <br \> <input type="button" class="addButton" value="hinzufügen"></td>' . "\n";
                $doc .= "<td>$price EUR</td>\n";
                $doc .= '<td><input type="number" value="1" class="nudAmount"></td>' . "\n";
                $doc .= "<td>$description</td>\n";
                $doc .= '<td><img style="width: 100px;" src="' . $imagelink . '"></td>' . "\n";
                $doc .= '           </tr>' . "\n";
            }
              $doc .= '              </tbody>
            </table>
                    <input type="button" class="addButton" value="zum Warenkorb">
          </div>
        </div>';
    }
}
