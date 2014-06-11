/*
 * Ext JS Library 2.1
 *
 */

Ext.onReady(function(){
    Ext.QuickTips.init();

	// for toolTip
	Ext.menu.BaseItem.prototype.onRender = function(container){
		this.el = Ext.get(this.el);
		container.dom.appendChild(this.el.dom);
		if (this.tooltip) {
		this.el.dom.qtip = this.tooltip;
		}
	};

	// end Here


    // Menus can be prebuilt and passed by reference
    var menuHome = new Ext.menu.Menu({
        id: 'menuHome',
         items: [
			{
                text: 'Můj profil',
				tooltip:'Můj profil',
				 handler: editUserProfile
			},
			{
                text: 'Změna hesla',
				tooltip:'Změna hesla',
			    href :'ChangePassword.do?operation=edit&pageOf=pageOfChangePassword'
            }
        ]
    });
            // For Search link

    var menu_search = new Ext.menu.Menu({
        id: 'menu_search',
        items: [
			{
                text: 'Uložené dotazy',
				tooltip:'Uložené dotazy',
			    href : 'RetrieveQueryAction.do'
            },
			{
                text: 'Jednoduché',
				tooltip:'Jednoduché vyhledávání',
			    href : 'SimpleQueryInterface.do?pageOf=pageOfSimpleQueryInterface'
            },
			{
                text: 'Pokročilé',
				tooltip:'Pokročilé vyhledávání',
			    href : 'QueryWizard.do?'
            },
            {
                text: 'Můj seznam',
				tooltip:'Můj seznam',
                href:'ViewCart.do?operation=view'
            }
        ]
    });

	//For Help Tab

	var helpMenu = new Ext.menu.Menu({
        id: 'helpMenu',
         items: [
			{
				text: 'Nápověda',
				href:'/catissuecore/RedirectToHelp.do',
				tooltip:'Nápověda'
			},
			{
				text: 'Uživatelská přiručka',
				href: '#',
				handler: getUserGuideLink,
				tooltip: 'Uživatelská přiručka'
			},
			{
				text: 'UML Model',
				href:'#',
				handler: getUmlModelLink,
				tooltip:'UML Model'
			}
        ]
    });

    var tb = new Ext.Toolbar();
    tb.render('toolbarLoggedIn');

	tb.add(new Ext.Toolbar.MenuButton({text: 'Home',link:'Home.do',handler: handleMenu,menu: menuHome}),

		{
       		text: 'Vyhledávání',
            menu: menu_search  // assign menu by instance
        },

		{	text:'Pomoc',
			menu: helpMenu
		}
		);


    // functions to display feedback


    function onItemCheck(){
		alert("This Page is under construction");
      //  Ext.example.msg('Item Check', 'You {1} the "{0}" menu item.', item.text, checked ? 'checked' : 'unchecked');
    }
	function handleMenu(item)
	{
	document.location.href = item.link;
	}


});
