AAX Plug-In Page Table Editor
v. 1.0
07/17/2014

Copyright 2014-2015 Avid Technology, Inc.  All rights reserved.  This
application is part of the Avid Plug-In SDK and is Confidential Information of
Avid Technology, Inc.  Access to and use of this application is restricted to
Avid Third-Party Developers who are validly licensed under the Avid Third
Party Developer and Nondisclosure Agreement (the "Developer Agreement")
subject to the terms and conditions of the Developer Agreement.


================================================================================
AAX Plug-In Page Table Editor
================================================================================


--------------------------------------------------------------------------------
About
--------------------------------------------------------------------------------
* Application for editing .xml page table files used in AAX plug-ins
* Currently available page table layouts for editing:

    - MkTL - Mackie HUI
    - HgTL - 002/003 and Command|8
    - FrTL - Control 24 and C|24
    - BkCS - ICON Channel Strip
    - BkSF - ICON Custom Fader
    - DgGT - Dynamics section (Gate/Expander)
    - DgCP - Dynamics section (Compressor/Limiter)
    - DgEQ - EQ section
    - Av81 - EUCON 8x1 section
    - Av48 - EUCON 4x8 section

--------------------------------------------------------------------------------
Requirements
--------------------------------------------------------------------------------
* OS X 10.8 or higher

--------------------------------------------------------------------------------
Usage Notes
--------------------------------------------------------------------------------
WARNING: In case if you decided to use the legacy PeTE editor for some reason,
be aware of known issue [2].

--------------------------------------------------------------------------------
Basic Operation
--------------------------------------------------------------------------------
1. Opening/Generating a PageTables file
    
    a) Load a PageTables file
         i) File -> Open (Cmd + O)
         ii) Select the desired page table XML file

        or: drag-and-drop the desired XML onto the main window
        
    b) Generate a default XML file using an AAX plug-in bundle
        i) File -> Generate default XML
        ii) Select the desired plug-in bundle and the target XML file path
        or: simply drag-and-drop the plug-in bundle onto the main window
        iii) Select 'Use parameter name' (see known issues [1])

    In the main window you can see all available control surfaces.

2. Open a control surface layout window
    * Double click on a particular control surface in main window
        * Surfaces with an available editor are marked with a pencil icon
    * or: Window -> Control Surface Layout

3. To start modifying a page table it needs to contain at least one page
    * In the layout window, click on the [+] icon to add a page
    * or: Drag any parameter to the control surface layout image to create an 
      assignment (a new page will be created automatically)

    There are list of available hotkeys for performing operations on pages:
        * (Cmd + ->) leads to the next page
        * (Cmd + <-) leads to the previous page
        * (Cmd + N) creates New page
        * (Cmd + D) duplicates current page
        * (Cmd + R) removes the selected page
        * 'Tab' switching between PageTable types, from left to right order. 
          E.g. from 'Av81' to 'PcTL' in S6 layout window

        Also you can get the list of available hotkeys by pressing the (?) sign
        in the top right corner of the layout window

4. Assigning parameters to a page table layout 
    Parameters can be assigned to the dedicated positions/cells in 2 ways:

    a) using contextual menus
        i) On the right side of the window right click on a parameter's name and
           select 'Assign parameter'
        ii) Click on the target cell on the control surface
    b) using Drag-and-Drop 
        * Drag a particular parameter from the list to the desired position/cell
        * Drag-and-Drop an assigned parameter between locations to swap their
          assignments
     
    For more information, see "Notes about parameter assignments" below

5. Unassigning parameters
    Parameters can be unassigned in three ways:
    a) Using contextual menu: Right click on desired parameter and select
       'Remove parameter' 
    b) Using Drag-and-Drop: Drag the parameter to any free space in the
       layout window 
    c) Using keyboard keys:
       * 'Backspace' key to delete a single parameter assignment
       * Cmd + 'Backspace' to delete an entire cell assignment

6. Specific operations with EUCON cells (available for EUCON TableTypes only)
    An entire EUCON knobcell (3 assignments: Knob, Sel, In) can be swapped or
    duplicated to another cell within the current control surface layout using
    Drag-and-Drop with modifier keys:
    * Cmd + Drag: swap knobcells
    * Cmd + Opt + Drag: copy an entire EUCON knobcell to another cell
  
    A EUCON cell can be copied to another surface layout using contextual menus
    a) Right click on any of the 3 fields of a knob cell and select "Copy knob
       cell"
    c) In another surface layout window right click on the desired knob cell
       and select "Paste knob cell" 
        
7. Using 'Abbr' mode
    'Abbr' mode displays the abbreviated names of parameters on a control
    surface. These are the names that a user will see when using the physical
    control surface.
    * Click on the 'Abbr' icon in the layout editor window
    * Right-click on the 'Abbr' icon to show a contextual menu
    
8. Editing abbreviated names using the Parameter Names window
    The Parameter Names window allows you to change/add any desired
    abbreviations for the plug-in's parameters.
    
    By default, 4, 6, and 8 Char abbreviated lengths are shown. The columns for
    other abbreviation lengths (from 1 to 31 characters) can be inserted using
    a contextual menu (Right-click on the table header to show the menu).
    
    Note: You cannot edit an abbreviation to contain a different number of
    characters than the column's declared character length.

9. Saving and exiting
    * File -> Save (Cmd + S)
    * AAX Plug-In Page Table Editor -> Quit (Cmd + Q)
      
    Note: Upon Save you might be warned about issues in the page table file
    * if the XML does not contain all required EUCON layouts
    * if there are empty pages in any of the layouts
    * if the editor has detected any other possible compatibility issues
            

--------------------------------------------------------------------------------
Notes about parameter assignments
--------------------------------------------------------------------------------
Different types of control surfaces use different layout restrictions
* Allowed assignment locations will be highlighted while a Drag-and-Drop is
  performed
* In general, continuous parameters can be assigned only to rotary encoders.
    * In EUCON page tables, continuous controls can also be assigned to Sel
      switches. The Sel switch on the control surface will be used to toggle
      which continuous parameter gets assigned to the cell's rotary encoder
* Discrete controls can generally be assigned to any kind of encoder or switch
* In EUCON page tables, it is illegal to map a parameter only to the Sel
  switch in a cell, with the Knob and In switch left un-assigned. With this
  layout, the knobcell will not appear on the surface
* In EUCON page tables, if a parameter is mapped to the In switch while no
  parameter is mapped to the Knob, the In switch mapping will automatically
  be used for the Knob as well on the physical control surface (see known
  issues [6])

The following EUCON page table requirements are enforced by the editor. Upon
Save you will be warned with a corresponding message. Be sure that your
generated page tables conform to all of the requirements of the latest EUCON
control surface software version.

Requirements for compatibility with Avid S6 v2.0:
* The Av81 page table must contain the union of all the controls (i.e. knobs &
  switches) contained in any other EUCON page tables.

Requirements for legacy Avid S6 software versions (not enforced by the editor):

Requirements for compatibility with Avid S6 v1.3:
* All parameter IDs used in the EUCON page tables must be defined with a
  Ctrl ID within the ControlNameVariations element.
* Each knob cell must have an assignment on the In switch, the Knob, or be
  completely empty. A knob cell may not contain an assignment on only the
  Sel switch.
* Any parameter that is assigned to an encoder in any 'AvXX' table must also
  be assigned to the same encoder somewhere in the 'Av81' table. For
  example, a parameter that is assigned to a Sel switch in the 'Av48' table
  must also be assigned to a Sel switch somewhere in the 'Av81' table.

Requirements for compatibility with Avid S6 v1.2:
* All parameter IDs used in the EUCON page tables must be defined with a
  Ctrl ID within the ControlNameVariations element.
* Every Cell with at least one parameter assignment must include a knobID
  assignment. It is not valid to assign either inOutButtonID or
  selectButtonID without also assigning the cell's knobID.
* For a given knobID, the same parameters must be assigned to the
  selectButtonID and inOutButtonID switches across all EUCON page tables
* Every knob cell assignment set (Rotary+Sel+In assignment) used in the
  'Av48' table must be exactly replicated somewhere in the 'Av81' table
* 'Av48' tables may contain no more than two pages    

--------------------------------------------------------------------------------
DigiOptions file usage
--------------------------------------------------------------------------------
      
DigiOptionsFile.txt is a special options file that can be used to toggle
certain test functionality. When PageTable Editor runs, it looks for
DigiOptionsFile.txt in the same directory as itself, loads the options that
are presented in this file, and generates an acknowledgement file,
DigiOptionsFile.ack.txt . If no DigiOptionsFile.txt is found, an
acknowledgement file is generated showing the default value for each option.

Features available via DigiOptions file:
    * PageTableEditorEnableChangeParameterType
      Enables a Menu item for changing a parameter type in the Control
      Name Editor.
      
    * PageTableEditorEnableDeleteParameter
      Enables a Menu item for deleting a parameter from the layout. This
      removes the parameter from all tables in the current PTLayout.
      
    * PageTableEditorEnableNonDefaultLayouts
      Enables editor additional editor windows that are not available in the
      standard configuration. These may be in-progress editors that do not
      yet have a polished UI.


================================================================================
Known issues
================================================================================

1. PTSW-190496
   In some versions of Pro Tools, if you use parameters' IDs in page tables
   then they will not be replaced with the actual parameters' names when
   displayed on control surfaces or in the plug-in's automation window in
   Pro Tools. They will be replaced with abbreviated names when provided, but
   displays of full-length parameter names will use the parameter's ID string
   rather than the parameter name string.

2. AAXTOOL-122
   PeTE will remove all EUCON sections from any page table XML file that it
   saves. It is important to ALWAYS BACK UP YOUR PAGE TABLE FILE before
   editing the file in PeTE.

3. AAXSDK-139
   AAX SDK versions prior to 2.1 include a bug in the 
   AAX_CEffectParameters::GetParameterNameOfLength() implementation. This
   bug will prevent the Page Table Editor from retrieving abbreviated
   parameter names from plug-ins that use the default implementation of
   GetParameterNameOfLength(). This bug was resolved in AAX SDK 2.1.

4. AAXTOOL-431
   PeTE may crash when editing short control names on systems with
   non-English internationalization settings (i.e. language.) This issue is
   specific to the legacy PeTE application.

5. AAXTOOL-367
   FIXED in Page Table Editor 1.0
   
   AAX Plug-In Page Table Editor does not enforce EUCON page table
   restrictions. Users must manually verify that the generated page tables
   are valid EUCON page tables.

6. AAXTOOL-992
   On an S6 console, if you define an 'In' switch (inOutButtonID) in a
   knobcell with no 'knobID', the 'inOutButtonID' switch will appear on the
   knob also. The Page Table Editor does not reflect this behavior.

7. AAXTOOL-126
   AAX Plug-In Page Table Editor removes unknown sections from XML. 
   Upon Save command user receives a warning message about comments
   and other unknown XML tags being erased. Choosing Save As lets you 
   save the current XML to a new file without unknown elements.  

8. AAXTOOL-209
   Keyboard shortcuts may not work if the keyboard language is not English

9. AAXTOOL-996
   System shortcuts do not work in native OS dialogues.

10. AAXTOOL-1012
    AAX Plug-In Page Table Editor might fail to call 'Open file' dialog

11. AAXTOOL-739
    AAX Plug-In Page Table Editor hangs on quit if some dialog window is open.
    It occurs only with the open/save file dialogs.

12. AAXTOOL-751
    The 'Generate default XML' dialog closes on attempt to show open/save file
    dialog.

