<?php

class body {
    public function body(){
    }
    public function createbody() {
        global $params;
        if (isset($params['category'])) {
	        $this->articleview(intval($params['category']));
		} elseif (isset($params['login'])) {
			$this->loginview();
		} else {
			$this->articleview(null);
		}

	}

	private function loginview(){
		global $db;
		global $doc;
		$doc .= '			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<h1 class="page-header">MasterShop24</h1>

				<div class="row placeholders">
					<h4>Login</h4>
				</div>


				<div class="table-responsive">
					<table class="table table-striped table-borderd">

						<tbody>
							<tr><form action="login.php" method="post">
   Username: <input type="text" name="username" /><br />
   Passwort: <input type="password" name="passwort" /><br />
   <input type="submit" value="Anmelden" />
  </form></tr>
						</tbody>
					</table>
				</div>

			</div>';
	}//onclick="Login()"

	private function articleview($category) {
        global $db;
        global $doc;
        $doc .= '<script type="text/javascript" src="../scripts/js/costum.js"></script>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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
              if (isset($category) && !$category == '') {
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
