/**
 *	
 *	This file is from the demo website of the Constellation Admin Skin
 *	
 *	If you like it and wish to use it, please consider buying it on ThemeForest:
 *	http://themeforest.net/item/constellation-complete-admin-skin/116461
 *	
 *	Thanks!
 *	
 */

/**
 * Template JS for Internet Explorer 8 and lower - mainly workaround for missing selectors
 */

(function($)
{
	// Standard template setup for IE
	$.fn.addTemplateSetup(function()
	{
		// Clean existing classes
		this.find('.first-child').removeClass('first-child');
		this.find('.last-child').removeClass('last-child');
		this.find('.last-of-type').removeClass('last-of-type');
		this.find('.even').removeClass('even');
		this.find('.odd').removeClass('odd');
		
		// Missing selectors
		this.find(':first-child').addClass('first-child');
		this.find(':last-child').addClass('last-child');
		
		// Specific classes
		this.find('.head').each(function () { $(this).children('div:last').addClass('last-of-type'); });
		this.find('tbody tr:even, .task-dialog > li:even, .planning > li.planning-header > ul > li:even').addClass('even');
		this.find('tbody tr:odd, .planning > li:odd').addClass('odd');
		this.find('.form fieldset:has(legend)').addClass('fieldset-with-legend').filter(':first-child').addClass('fieldset-with-legend-first-child');
		
		// Disabled buttons
		this.find('button:disabled').addClass('disabled');
		
		// IE 7
		if ($.browser.version < 8)
		{
			// Clean existing classes
			this.find('.after-h1').removeClass('after-h1');
			
			this.find('.block-content h1:first-child, .block-content .h1:first-child').next().addClass('after-h1');
			this.find('.calendar .add-event').prepend('<span class="before"></span>');
		}
		
		// Input switches
		this.find('input[type=radio].switch:checked + .switch-replace, input[type=checkbox].switch:checked + .switch-replace').addClass('switch-replace-checked');
		this.find('input[type=radio].switch:disabled + .switch-replace, input[type=checkbox].switch:disabled + .switch-replace').addClass('switch-replace-disabled');
		this.find('input[type=radio].mini-switch:checked + .mini-switch-replace, input[type=checkbox].mini-switch:checked + .mini-switch-replace').addClass('mini-switch-replace-checked');
		this.find('input[type=radio].mini-switch:disabled + .mini-switch-replace, input[type=checkbox].mini-switch:disabled + .mini-switch-replace').addClass('mini-switch-replace-disabled');
	});
	
	// Input switches
	$('input[type=radio].switch, input[type=checkbox].switch').live('click', function()
	{
		var input = $(this),
			replaced = input.next('.switch-replace');
		if (!replaced.hasClass('switch-replace-disabled'))
		{
			if (!this.checked)
			{
				replaced.addClass('switch-replace-checked');
			}
			else
			{
				replaced.removeClass('switch-replace-checked');
			}
		}
	});
	$('input[type=radio].mini-switch, input[type=checkbox].mini-switch').live('click', function()
	{
		var input = $(this),
			replaced = input.next('.mini-switch-replace');
		if (!replaced.hasClass('mini-switch-replace-disabled'))
		{
			if (!this.checked)
			{
				replaced.addClass('mini-switch-replace-checked');
			}
			else
			{
				replaced.removeClass('mini-switch-replace-checked');
			}
		}
	});

})(jQuery);