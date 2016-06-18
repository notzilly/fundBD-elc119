<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Excel;
use Illuminate\Http\Request;

class ConversaoController extends Controller {

	public function InsereTabelao(){
		Excel::load('F:\Arquivos e Programas\Xampp\htdocs\BD\dominio2.xlsx', function($reader){
			$reader->ignoreEmpty();
			$results = $reader->get()->toArray();
			$lastIndex = count($results);
			$queryTabelao = 'INSERT INTO tabelao (dominio, documento, nome, uf, cidade, cep, data_cadastro, ultima_atualizacao, ticket) VALUES';
			foreach($results as $key => $value){
				$queryTabelao .= '(';
				$queryTabelao .= "'" .$value['dominio'] ."',";
				$queryTabelao .= "'" .$value['documento']."',";
				$queryTabelao .= "'" .$value['nome']."',";
				$queryTabelao .= "'" .$value['uf']."',";
				$queryTabelao .= "'" .$value['cidade']."',";
				$queryTabelao .= "'" .$value['cep']."',";
				$queryTabelao .= "'" .$value['data_cadastro']."',";
				$queryTabelao .= "'" .$value['ultima_atualizacao']."',";
				$queryTabelao .= $value['ticket'];
				$queryTabelao .= ')';
				if($key < $lastIndex - 1){
					$queryTabelao .= ',' . '<br>';
	
				}
			}
			echo $queryTabelao;
		})->get();
	}
}
