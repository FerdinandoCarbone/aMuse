#  
Per qualsiasi applicazione creata, è necessario fornire una proprietà body calcolata che definisca le scene dell'applicazione, ovvero istanze conformi al protocollo Scene. Ad esempio, si può creare una semplice applicazione con una sola scena contenente una sola View:


'''

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}


'''

init() c’è sempre, è implicito. Serve a inizializzare la struttura di deafult e creare un'istanza nall'app (sostianzialmente prende l'oggetto e lo mette in memoria), in determinati casi può essere esplicitato per “forzare” XCode a leggere un passaggio prima degli altri, in tal caso si usa come funzione:

'''
    init() 
        let apparence = UITabBarAppearance()
        apparence.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = apparence

'''

In questo caso abbiamo detto a xcode di dare priorità a questo passaggio, cioè rendere visibile la tab bar.
Nb: L'init è la prima cosa eseguita a codice, prima che la view venga creata. Se devi utilizzare una variabile significa che devi inizializzare il valore di quella variabile prima che la view venga creata, perciò si usa l'init. invece, se vogliamo che una funzione venga eseguita come prima azione dopo che la view è stata creata bisogna usare .onAppear .  

'''
















@main rappresenta il punto di ingresso dell'applicazione, sostanzialemnte inizializza ed esegue l'applicazione. Volendo si può dire a xcode di rimanere nel thread principale con il @mainactor, questo perchè il sistema operativo utilizza dei canali secondari per scaricare dati dai server, che ovviamente sono più lenti perchè non hanno alta priorità nel sistema operativo. I thread hanno infatti dei quality of service, che ne descrivono proprio la priorità. In questi canali secondari il sistema operativo opera in background e scarica i dati. I dati così scaricati non posso essere pubbliati direttamente nella View, che deve aggiornare (viene fuori un errore viola, che ti dice "guarda, stai aggiornando una view non nel thread principale"). Dato che la view deve essere aggiornata sempre nel thread principale, a volte è necessario specificarlo.

In effetti, questa impostazione è così importante per il funzionamento di ObservableObject che SwiftUI la inserisce direttamente: ogni volta che si usa @StateObject o @ObservedObject all'interno di una View, Swift si assicura che l'intera view venga eseguita sull'attore principale, in modo che non si possa accidentalmente cercare di pubblicare aggiornamenti dell'interfaccia utente in modo pericoloso. Inoltre, indipendentemente dai property drappers utilizzati, la proprietà body delle view SwiftUI viene sempre eseguita sull'attore principale.

Questo significa che non è necessario aggiungere esplicitamente @MainActor agli ObservableObject? No, ci sono ancora dei vantaggi nell'usare @MainActor con queste classi, soprattutto se usano async/await (sono dei metodi che fanno parte del protocollo concurrency, che in Swift servono a scaricare dati da internet) per fare il loro lavoro asincrono, come scaricare dati da un server.

Quindi, anche se SwiftUI assicura la presenza dell'attore principale quando si usano @ObservableObject, @StateObject e i property drappers della view di SwiftUI, è una buona idea aggiungere l'attributo @MainActor a tutte le classi di oggetti osservabili, per essere assolutamente sicuri che tutti gli aggiornamenti dell'interfaccia utente avvengano sull'attore principale. Se si ha bisogno che alcuni metodi o proprietà calcolate non vengano eseguiti sull'attore principale, utilizzare nonisolated come si farebbe con un regular actor.



