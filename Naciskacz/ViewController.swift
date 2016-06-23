//
//  ViewController.swift
//  Naciskacz
//
//  Created by Kamil Wójcik on 03.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //zerujemy dane, jak coś się wpisze to nadpisze to
    var maksymalneNaciśnięcia = 0
    var aktualneNaciśnięcia = 0
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var ileNaciśnięć: UILabel!
    @IBOutlet weak var przyciskGwiazdka: UIButton!
    @IBOutlet weak var przyciskGraj: UIButton!
    @IBOutlet weak var ileNaciśnięćWpisz: UITextField!
    
    //przypisujemy ukrycie żeby po naciśnięciu graj ukryły się przyciski których nie chcemy, potem przypisujemy wartość tekstową wpisaną przez użytkownika do naszej zmiennej maksymalnenacisniecia, przy czym konwertujemy tekst który jest string do int żeby były liczby i tadam
    @IBAction func Graj(sender: AnyObject) {
        
        //sprawdzamy czy coś w ogóle zostało wpisane do pola, jeżeli tak to wykonuje jeżeli nie nic się nie dzieje
        if ileNaciśnięćWpisz.text != nil && ileNaciśnięćWpisz.text != "" {
            logo.hidden = true
            przyciskGraj.hidden = true
            przyciskGwiazdka.hidden = false
            ileNaciśnięć.hidden = false
            ileNaciśnięćWpisz.hidden = true
            
            maksymalneNaciśnięcia = Int(ileNaciśnięćWpisz.text!)!
            
            aktualneNaciśnięcia = 0
            
            aktualizujLiczbę()
            
            
        }
    }
    
    //ikrementujemy liczbę naciśnięć za każdym razem kiedy naciskamy naszą gwiazdkę i wpisujemy to do labela
    @IBAction func Gwiazdka(sender: AnyObject) {
        aktualneNaciśnięcia += 1
        aktualizujLiczbę()
        
        //jeżeli gra się skończyła to wtedy restart gry, nie musimy więcej pisać bo zwraca prawdę więc będzie dopsze gdy będzie prawda się wykona
        if czyGraSięSkończyła() {
            restartGry()
        }
    }
    
    func aktualizujLiczbę() {
        if aktualneNaciśnięcia != 1 {
            ileNaciśnięć.text = "Nacisnąłeś \(aktualneNaciśnięcia) razy ;)"
        }else{
        ileNaciśnięć.text = "Nacisnąłeś \(aktualneNaciśnięcia) raz ;)"
        }
    }
    
    //restart gry, wracamy do początkowych ustawień
    func restartGry() {
        maksymalneNaciśnięcia = 0
        aktualneNaciśnięcia = 0
        ileNaciśnięćWpisz.text = ""
        
        logo.hidden = false
        przyciskGraj.hidden = false
        ileNaciśnięćWpisz.hidden = false
        przyciskGwiazdka.hidden = true
        ileNaciśnięć.hidden = true
    }
    
    //taka funkcja która będzie sprawdzała czy gra się skończyła, w sumie mogliśmy to zrobić też wyżej bez funkcji, whatever
    func czyGraSięSkończyła () -> Bool {
        if aktualneNaciśnięcia >= maksymalneNaciśnięcia {
            return true
        }else{
        return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

